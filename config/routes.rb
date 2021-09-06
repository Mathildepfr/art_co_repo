Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'dashboard#dashboard'
  resources :users

  resources :collections
  resources :artworks

  resources :venues do
    resources :expos, only: [:new, :create]
  end

  resources :expos, only: [:destroy, :edit, :update]
end
