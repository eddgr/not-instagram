Rails.application.routes.draw do
  root "posts#index"
  get 'log_in', to: "sessions#new", as: "log_in"
  get 'log_out', to: "sessions#destroy", as: "log_out"
  # get 'posts/index'
  # get 'posts/new'
  # get 'posts/show'
  # get 'users/index'
  # get 'users/new'
  # get 'users/show'
  get 'sign_up', to: "users#new", as: "sign_up"
  resources :sessions
  resources :relationships
  resources :posts
  resources :users, except: :destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
