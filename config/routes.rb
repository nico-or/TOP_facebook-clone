Rails.application.routes.draw do
  root "posts#index"

  devise_for :users

  resources :posts, only: %i[index show create destroy]  do
    resources :comments, only: %i[create]
    resources :likes, only: %i[create]
  end

  resources :likes, only: %i[destroy]

  resources :users, only: %i[index show update] do
    resources :friend_requests, only: %i[create]
  end

  resource :description, only: :edit

  resources :friend_requests, only: %i[destroy] do
    post 'accept', on: :member
  end

  resources :notifications, only: %i[index] do
    get 'read', on: :member
  end

  get '/profile', to: 'users#profile'
end
