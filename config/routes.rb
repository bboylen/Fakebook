Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, path: "accounts", :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }
  
  resources :posts do
    member do 
      post 'like'
      post 'unlike'
    end
  end
  
  get 'friends', to: 'users#index'
  resources :users, only: [:show] do
    post 'set_profile_picture', on: :member
  end
  
  resources :friend_requests, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
end
