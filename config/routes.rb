Rails.application.routes.draw do

  root 'home#home'

  resources :employees, path: '/admin'
  resources :clocks, only: [:create]
end
