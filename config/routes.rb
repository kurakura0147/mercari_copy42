Rails.application.routes.draw do

  get 'transactions/new'

  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new]
  resources :users, only: [:new , :show, :edit, :update] do
    member do
      get 'signout'
    end
  end
  resources :credit_cards, only: [:index, :new]
end
