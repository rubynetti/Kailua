Rails.application.routes.draw do
  resources :socios
  root "socios#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
