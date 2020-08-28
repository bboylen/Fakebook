Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, path: "accounts"
  
  resources :posts do
    member do 
      post 'like'
      post 'unlike'
    end
  end
  get 'friends', to: 'users#index'
  resources :users, except: [:index]
  
#path: :friends
  resources :friend_requests
  resources :friendships
  resources :comments, only: [:create, :destroy]
end
