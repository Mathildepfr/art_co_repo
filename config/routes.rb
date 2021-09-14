Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'dashboard#dashboard'
  get 'search', to: 'pages#search'
  get 'map', to: 'venues#map'

  resources :users

  resources :collections
  resources :artworks

  resources :venues do
    resources :expos, only: %i[new create]
  end

  resources :expos, only: %i[destroy edit update]
end
