class TracksController < ApplicationController
  before_action :set_album
  before_action :set_track, only: [:show, :update, :destroy]

  # GET /tracks.json
  def index
    @tracks = Album.find(params[:album_id]).tracks
  end

  def show
  end
  
  # POST /tracks.json
  def create
    @track = @album.tracks.build(track_params)
  
    respond_to do |format|
      if @track.save
        format.json { render :show, status: :created, location: @album }
      else
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracks/1.json
  def update
    respond_to do |format|
      if @track.update(track_params)
        format.json { render :show, status: :ok, location: @album }
      else
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1.json
  def destroy
    @track.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:album_id])
    end

    def set_track
      @track = @album.tracks.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:title, :number)
    end
end