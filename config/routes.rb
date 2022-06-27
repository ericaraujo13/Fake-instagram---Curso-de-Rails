Rails.application.routes.draw do
  devise_for :users, only: [:sessions, :registrations, :passwords]
  root 'posts#index'
  resources :posts, only: [ :index, :show, :new, :create ]
  resources :users, only: [:show], param: :username
  get "edit_profile", to: "users#edit"
  patch "profile", to: "users#update"
end
