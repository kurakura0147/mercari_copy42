Rails.application.routes.draw do

  devise_for :users, controllers: {
    :registrations => 'users/registrations'
  }

  root 'items#index'

  resources :items, only: %i(index new create show edit destroy edit update) do
    member do
      get :buy
      post :pay
      get :check
    end

    collection do
      get :search_brand
      get :search
    end
  end

  resources :users, only: %i(new show edit update) do
    member do
      get :signout
      get :listing
      get :purchase
    end
  end

  resources :credit_cards, only: [:index, :new]

end
