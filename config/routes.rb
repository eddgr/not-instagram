Rails.application.routes.draw do
  root "posts#index"
  get 'log_in', to: "sessions#new", as: "log_in"
  get 'log_out', to: "sessions#destroy", as: "log_out"
  get 'sign_up', to: "users#new", as: "sign_up"
  resources :sessions

  get 'search', to: "posts#search", as: "search"
  get 'explore', to: "posts#explore", as: "explore"
  resources :posts do
    resources :comments, only: :create
    # comments belongs_to posts
    resources :likes, only: [:create, :destroy]
  end

  get 'inbox', to: "message_threads#index", as: "inbox"
  resources :message_threads do
    resources :messages, only: :create
  end

  resources :relationships, only: [:create, :destroy]
  # used for Follow and Unfollow

  get 'users/:id/following', to: "users#following", as: "following"
  get 'users/:id/followers', to: "users#followers", as: "followers"
  resources :users do
    member do
      get :following, :followers
      # allows following and followers method to be called from user
    end
  end
end
