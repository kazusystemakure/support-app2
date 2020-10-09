Rails.application.routes.draw do
  devise_for :users
  root to: "lessons#index"
  resources :lessons do
    resources :orders, only: [:index, :create]
    resources :users, only: :show
  end
  resources :users, only: [:edit, :update]
end
