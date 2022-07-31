Rails.application.routes.draw do
  root "posts#index"

  devise_for :users

  resources :likes, only: %i[create destroy]

  resources :posts, only: %i[index show create destroy]

  resources :comments, only: %i[create]

  resources :users, only: %i[index show]

  get '/profile', to: 'users#profile'
end
