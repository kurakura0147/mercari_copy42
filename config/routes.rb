Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new]
  resources :users, only: [:new , :show] do
    member do
      get 'signout'
    end
  end
end
