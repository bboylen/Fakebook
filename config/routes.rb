Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, path: "accounts"
  
  resources :posts
  resources :users, path: :friends
  resources :friend_requests
  resources :comments, only: [:create, :destroy]
end
