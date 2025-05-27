Rails.application.routes.draw do
  root to: 'home#index'

  resources :home, only: :index
  resources :order_requests, only: :create
  resources :items do
    resources :reviews, only: %i[new create show]
  end

  post "assistant/recommend", to: "assistant#recommend"
end
