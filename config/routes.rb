Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/players', to: 'players#index'
  get '/players/:id', to: 'players#show'
end
