if defined?(Resque) && defined?(Redis)
  Resque.redis = Redis.new(url: Rails.configuration.x.redis.url)
end

# Web interface
if defined?(Resque::Server)
  Resque::Server.use(Rack::Auth::Basic) do |user_name, password|
    user_name == Rails.configuration.x.resque.user_name
    password == Rails.configuration.x.resque.password
  end
end
