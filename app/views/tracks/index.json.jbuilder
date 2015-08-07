json.array!(@tracks) do |track|
  json.extract! track, :id, :title, :number
  json.url album_track_url(track.album,track, format: :json)
end
