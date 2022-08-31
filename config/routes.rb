Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy ]
    
  end
  resources :comments do
    resources :favorites, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]

  root 'posts#index'
end
