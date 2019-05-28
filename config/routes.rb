Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/location/create', to: 'locations#create'
  post '/event/create', to: 'events#create'
end
