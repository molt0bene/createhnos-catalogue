Rails.application.routes.draw do
  root to: 'home#index'

  resources :home, only: :index
  resources :items
  resources :users, except: [:index]
  resources :reviews, only: %i[new create destroy show]
end
