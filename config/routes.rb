Rails.application.routes.draw do
  devise_for :users, only: [:sessions, :registrations, :passwords]
  root 'posts#index'
  resources :posts, only: [ :index, :show, :new, :create ]
  resources :users, only: [:show], param: :username
end
