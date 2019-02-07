Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :transactions, only: [:new]

  resources :items, only: [:index, :new, :show] do
    member do
      get :buy
      post :pay
    end
  end
  resources :users, only: [:new , :show, :edit, :update] do
    member do
      get 'signout'
    end
  end
  resources :credit_cards, only: [:index, :new]
end
