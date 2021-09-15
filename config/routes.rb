Rails.application.routes.draw do
  get 'expo_collections/new'
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'dashboard#dashboard'
  get 'search', to: 'pages#search'

  resources :users

  resources :collections
  resources :artworks

  resources :venues do
    resources :expos, only: %i[new create edit update destroy]
  end

  resources :expos, only: %i[destroy edit update index] do
    resources :expo_collections, only: %i[new create]
  end
  resources :expo_collections, only: %i[update destroy]
end
