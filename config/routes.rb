Rails.application.routes.draw do
  resources :visits
  resources :museums, only: :show
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
