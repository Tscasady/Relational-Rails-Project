Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/players', to: 'players#index'
  get '/players/new', to: 'players#new'
  get '/players/:id', to: 'players#show'
  get '/players/:id/games', to: 'players/games#index'
  get '/players/:id/games/new', to: 'players/games#new'
  post '/players/:id/games', to: 'players/games#create' 
  get '/games', to: 'games#index'
  get '/games/:id', to: 'games#show'
  get '/games/:id/edit', to: 'games#edit'
  patch '/games/:id', to: 'games#update'
  post '/players', to: 'players#create'
  get '/players/:id/edit', to: 'players#edit'
  patch 'players/:id/', to: 'players#update'
  delete 'players/:id', to: 'players#destroy'
end
