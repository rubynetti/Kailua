Rails.application.routes.draw do
  resources :contacts
  resources :categories
  resources :outcomes
  resources :incomes
  resources :verbals
  resources :socios
  resources :balances
  root "socios#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
