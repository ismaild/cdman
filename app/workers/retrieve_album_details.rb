class RetrieveAlbumDetails
  @queue = :default

  def self.perform(album_id)
    lastfm = Lastfm.new(ENV['LASTFM_API_KEY'], ENV['LASTFM_API_SECRET'])
    album = Album.find(album_id)
    begin
      result = lastfm.album.get_info({artist: album.artist, album: album.title, autocorrect: 1})
      unless album.image_url
        album.image_url = result['image'].select {|a| a['size']=="extralarge"}[0]['content']
      end
      result['tracks']['track'].each do |lfm_track|
        track = Track.new
        track.title = lfm_track['name']
        track.number = lfm_track['rank']
        track.duration = lfm_track['duration'].to_i
        track.artist = lfm_track['artist']['name']
        track.album = album
        track.save!
      end
      album.artist = result['artist']
      album.mbid = result['mbid']
      album.save!
    rescue StandardError => error
      Rails.logger.info("Auto save album details failed with: #{error}")  
    end
  end
end
