Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, path: "accounts"
  
  resources :posts
  resources :users, path: :friends do
    resources :friend_requests
  end
  resources :comments, only: [:create, :destroy]
end
