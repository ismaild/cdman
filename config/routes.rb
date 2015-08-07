Rails.application.routes.draw do
  resources :albums, constraints: {format: :json}, 
            defaults: {format: 'json'}, except: [:new,:edit]
end
