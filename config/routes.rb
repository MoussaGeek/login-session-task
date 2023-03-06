Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks
  resources :users, except: [:index]
  resources :sessions, only: [:new, :create, :destroy]
end
