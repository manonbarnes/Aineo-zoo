Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: :show
  resources :animals do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :bookings, only: [:show, :index, :destroy, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
