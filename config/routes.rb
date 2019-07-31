Rails.application.routes.draw do
  resources :visits
  resources :museums, only: [:show, :index]
  resources :users, only: [:new, :create, :show, :destroy]
  resources :comments, only: [:index, :new, :create, :edit, :update]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#logout"
  get "home", to: "museums#home"
end
