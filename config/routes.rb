Rails.application.routes.draw do
  resources :visits
  resources :museums, only: [:show, :index]
  resources :users
  resources :comments, only: [:index, :new, :create]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#logout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
