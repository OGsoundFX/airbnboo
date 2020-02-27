Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :properties, only: [:index, :show, :new, :create] do
    resources :bookings do
      resources :reviews
    end
  end

  # resources :users, only: [:show, :new, :create] do
  #  resources :bookings, only: [:new, :create]
  #  resources :reviews, only: [:new, :create]
  # end

  resources :users, only: [:show, :new, :create] do
    resources :dashboard, only: [:index, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
