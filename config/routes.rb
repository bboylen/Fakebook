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
  resources :users, except: [:index] do
    post 'set_profile_picture', on: :member
  end
  
  resources :friend_requests
  resources :friendships
  resources :comments, only: [:create, :destroy]
end
