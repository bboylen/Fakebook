Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, path: "accounts"
  
  resources :posts
  resources :users do
    resources :friendships
  end

end
