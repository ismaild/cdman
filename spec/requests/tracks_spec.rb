require 'rails_helper'

RSpec.describe "Tracks", type: :request do
  let(:track) { create :track }

  describe "GET /albums/:album_id" do
    it "returns tracks for albums details" do
      slug = track.album.slug

      get album_path(slug), {}, { "Accept" => "application/json" }
      json = JSON.parse(response.body)

      expect(json['tracks'][0]['title']).to eq('Smells Like Teen Spirit')
    end
  end

  describe "Post /albums/:album_id/tracks.json" do
    before :each do
      @params = {
        track: {
            title: "In Bloom",
            number: 2
        }
      }
    end

    it "creates a track for an album" do
      slug = track.album.slug
      post "/albums/#{slug}/tracks.json", @params
      expect(response.status).to eq(201)
      expect(Album.last.tracks.last.title).to eq('In Bloom')
    end

    it "does not create a track with missing data" do
      slug = track.album.slug
      params = @params[:track].delete(:title)
      post "/albums/#{slug}/tracks.json", @params
      json = JSON.parse(response.body)
      expect(response.status).to eq(422)
      expect(json['title']).to eq(["can't be blank"])
    end
  end

  describe "Patch /albums/:album_id/tracks/:id" do
    before :each do
      @params = {
        track: {
          title: "In Bloom",
          number: 2
        } 
      }
    end

    it "updates a track" do
      slug = track.album.slug
      slug_track = track.slug

      patch "/albums/#{slug}/tracks/#{slug_track}.json", @params
      expect(response.status).to eq(200)
      expect(Album.last.tracks.first.title).to  eq('In Bloom')
    end
  end

  describe "Delete /albums/:album_id/tracks/:id" do
    it "deletes a track" do
      slug = track.album.slug
      slug_track = track.slug

      delete album_track_path(slug, slug_track), {}
      expect(response.status).to eq(204)
      expect(Album.first.tracks.size).to  eq(0)
    end
  end
end