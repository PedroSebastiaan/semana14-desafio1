Rails.application.routes.draw do
  # resources :users, only: [:new, :create, :show]
  resources :stories
  root 'home#index'
  get 'home/index'
  get 'users/sign_up', to: 'users#new'
  get 'users/:id', to: 'users#show', as: 'profile'
  post 'users', to: 'users#create'
  resources :sessions, only: [:new, :create, :destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
