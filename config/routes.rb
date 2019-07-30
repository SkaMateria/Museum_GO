Rails.application.routes.draw do
  resources :visits
  resources :museums, only: [:show, :index]
  resources :users
  resources :comments, only: [:index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
