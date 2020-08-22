Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, path: "accounts"
  
  resources :posts do
    member do 
      post 'like'
    end
  end
  resources :users, path: :friends

  resources :friend_requests
  resources :friendships
  resources :comments, only: [:create, :destroy]
end
