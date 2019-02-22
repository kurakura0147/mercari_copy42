Rails.application.routes.draw do

  devise_for :users, controllers: {
    :registrations => 'users/registrations'
  }

  root 'items#index'

  resources :items, only: %i(index new create show edit destroy) do
    member do
      get :buy
      post :pay
    end

    collection do
      get :search_brand
    end
  end

  resources :transactions, only: %i(new)

  resources :users, only: %i(new show edit update) do
    member do
      get 'signout'
    end
  end

  resources :credit_cards, only: [:index, :new]

end
