Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :cats do
    resources :bookings
  end
  get '/dashboard', to: 'cats#dashboard', as: :cats_dashboard

  resources :users

  # JS reviews
  resources :cat_reviews, only: [:new, :create]
  resources :user_reviews, only: [:new, :create]
end
