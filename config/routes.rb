Rails.application.routes.draw do
  # get 'posts/index'
  # get 'posts/new'
  # get 'posts/show'
  # get 'users/index'
  # get 'users/new'
  # get 'users/show'
  resources :relationships
  resources :posts
  resources :users, except: :destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
