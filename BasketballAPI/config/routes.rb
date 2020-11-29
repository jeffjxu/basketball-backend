Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'players/for_user', to: 'players#for_user', as: :players_for_user
  get 'players/for_game', to: 'players#for_game', as: :players_for_game

  resources :users
  resources :games
  resources :players
  resources :favorites

  get :token, controller: 'application'
  get :authenticate_with_token, controller: 'application'
  get 'users/:id/games', to: 'users#games', as: :user_games
  get 'search', to: 'application#search', as: :search

  post :create_user, controller: 'application'
end
