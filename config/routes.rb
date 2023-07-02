Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :cats do
    resources :bookings
    resources :cat_reviews, only: [:new, :create]
  end
  get '/dashboard', to: 'cats#dashboard', as: :cats_dashboard

  resources :users

  # JS user reviews. Need to rethink this one a bit later
  resources :user_reviews, only: [:new, :create]
end
