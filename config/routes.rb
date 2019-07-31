Rails.application.routes.draw do
  resources :visits
  resources :museums, only: [:show, :index]
  resources :users, only: [:new, :create, :show, :destroy]
  resources :comments, only: [:index, :new, :create]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#logout"
  get "home", to: "museums#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
