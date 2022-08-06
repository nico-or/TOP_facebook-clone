Rails.application.routes.draw do
  root "posts#index"

  devise_for :users

  resources :posts, only: %i[index show create destroy]  do
    resources :comments, only: %i[create]
    resources :likes, only: %i[create]
  end

  resources :likes, only: %i[destroy]

  resources :users, only: %i[index show] do
    resources :friend_requests, only: %i[create]
  end

  resources :friend_requests, only: %i[destroy] do
    post 'accept', on: :member
  end

  get '/profile', to: 'users#profile'
end
