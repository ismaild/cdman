Rails.application.routes.draw do
  resources :albums, constraints: {format: :json}, 
            defaults: {format: 'json'}, except: [:new,:edit] do
              resources :tracks, constraints: {format: :json}, 
                  defaults: {format: 'json'}, except: [:new,:edit]
  end

  mount Resque::Server, at: '/resque' if defined?(Resque::Server)
end
