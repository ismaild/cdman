class RetrieveAlbumArt
  @queue = :default

  def self.perform(album_id)
    lastfm = Lastfm.new(ENV['LASTFM_API_KEY'], ENV['LASTFM_API_SECRET'])
    album = Album.find(album_id)
    result = lastfm.album.search(album.title)
    if result['results']['totalResults'] != '0' && result['results']['albummatches']['album'].first['image'].last['content']
      album.image_url = result['results']['albummatches']['album'].first['image'].last['content']
      album.save!
    end
  end
end
