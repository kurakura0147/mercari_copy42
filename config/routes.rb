Rails.application.routes.draw do
  get 'items/index'

  root 'application#hello'
end
