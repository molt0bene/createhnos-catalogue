Rails.application.routes.draw do
  root to: 'home#index'

  resources :home, only: :index
  resources :items
  resources :reviews, only: %i[new create show]
end
