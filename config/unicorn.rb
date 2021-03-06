worker_processes 3
timeout 30
preload_app true

@resque_pid = nil

before_fork do |server, worker|
  unless Rails.configuration.x.single_process_mode
    if defined?(Resque) && defined?(Redis)
      # Clean up Resque workers killed by previous deploys/restarts
      Resque.workers.each { |w| w.unregister_worker }
      @resque_pid ||= spawn('bundle exec rake resque:work QUEUE=*')

      # disconnect redis if in use
      Resque.redis.client.disconnect
    end
  end
end

after_fork do |server, worker|
  unless Rails.configuration.x.single_process_mode
    if defined?(Resque) && defined?(Redis)
      Resque.redis = Redis.new(url: Rails.configuration.x.redis.url)
    end
  end
end
