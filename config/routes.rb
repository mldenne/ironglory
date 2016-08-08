Rails.application.routes.draw do
  resources :billing_addresses
  resources :reviews
  resources :categories
  resources :orders
  resources :products
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
