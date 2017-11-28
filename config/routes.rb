Rails.application.routes.draw do

  root 'home#home'

  resources :employees
  resources :clocks, only: [:create]
end
