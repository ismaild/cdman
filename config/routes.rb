Rails.application.routes.draw do
  root to: 'pages#home'
  
  resources :albums, except: [:new,:edit] do
              resources :tracks, constraints: {format: :json}, 
                  defaults: {format: 'json'}, except: [:new,:edit]
  end

  mount Resque::Server, at: '/resque' if defined?(Resque::Server)
end
