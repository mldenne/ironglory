Rails.application.routes.draw do
  resources :shipping_addresses
  resources :billing_addresses
  resources :reviews
  resources :categories do
    resources :products
  end
  resources :orders
  resources :users
  resources :charges

  resources :orderings, only: [:create, :update, :destroy]

  root 'categories#index'
  post '/login' => 'user_sessions#create'
  get '/check' => 'user_sessions#show'
  delete '/logout' => 'user_sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
