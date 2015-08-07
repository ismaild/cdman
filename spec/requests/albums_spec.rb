require 'rails_helper'

RSpec.describe "Albums", type: :request do
  let(:album) { create :album }
  let(:album2) { create :album, title: 'Out of Time', artist: 'REM' }

  describe "GET /albums" do
    it "returns all albums" do
      album
      album2
      get albums_path
      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json.size).to eq(2)
    end
  end

  describe "GET /albums/:id" do
    it "returns album details" do
      slug = album.slug

      get album_path(slug)
      json = JSON.parse(response.body)

      expect(json['title']).to eq('Nevermind')
    end
  end

  describe "Post /albums" do
    before :each do
      @params = {
        album: {
          title: "The Joshua Tree",
          artist: "U2",
          release_date: DateTime.now
        } 
      }
    end

    it "creates an album" do
      post '/albums.json', @params
      expect(response.status).to eq(201)
      expect(Album.last.title).to eq('The Joshua Tree')
    end

    it "does not create an album with missing data" do
      params = @params[:album].delete(:artist)
      post '/albums.json', params
      json = JSON.parse(response.body)
      expect(response.status).to eq(422)
      expect(json).to include("errors")
    end
  end

  describe "Patch /albums/:id" do
    before :each do
      @params = {
        album: {
          title: "The Joshua Tree",
          artist: "U2"
        } 
      }    
    end

    it "updates an album" do
      slug = album.slug

      patch album_path(slug), @params
      expect(response.status).to eq(200)
      expect(Album.last.title).to eq('The Joshua Tree')
    end
  end

  describe "Delete /albums/:id" do
    it "deletes an album" do
      slug = album.slug

      delete album_path(slug), {}
      expect(response.status).to eq(204)
      expect(Album.all.size).to  eq(0)
    end
  end
end