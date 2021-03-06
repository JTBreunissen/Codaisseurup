Rails.application.routes.draw do
  resources :categories
  root to: 'pages#home'

  devise_for :users

  resources :users, only: [:show]
  resources :events
  resources :profiles, only: [:new, :edit, :create, :update]

  get "about" => "pages#about"
  resources :photos
  resources :rooms do
    resources :bookings, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
