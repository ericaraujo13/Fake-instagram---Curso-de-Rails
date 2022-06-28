Rails.application.routes.draw do
  devise_for :users, only: [:sessions, :registrations, :passwords]
  root 'posts#index'
  
  resources :users, only: [:show], param: :username
  get "edit_profile", to: "users#edit"
  patch "profile", to: "users#update"

  resources :posts, only: [ :index, :show, :new, :create ]
  resources :likes, only: [ :destroy, :create ]
  resources :comments, only: [ :create ]
end
