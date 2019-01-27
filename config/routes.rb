Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
<<<<<<< HEAD
  resources :users , only: [:show]
=======
  resources :users, only: [:new]
>>>>>>> t-naganuma/master
end
