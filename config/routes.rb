Rails.application.routes.draw do
  devise_for :users
  root to: "lessons#index"
  resources :lessons do
    resources :orders, only: [:index, :create]
  end
  resources :users, only: [:index, :show, :edit, :update]
end
