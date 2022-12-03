Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/players', to: 'players#index'
  get '/players/new', to: 'players#new'
  get '/players/:id', to: 'players#show'
  get '/players/:id/games', to: 'players/games#index'
  get '/games', to: 'games#index'
  get '/games/:id', to: 'games#show'
end
