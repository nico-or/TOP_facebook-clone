Rails.application.routes.draw do
  resources :posts, only: %i[show create destroy]

  resources :comments, only: %i[create]

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
