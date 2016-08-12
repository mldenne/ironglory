Rails.application.routes.draw do
  resources :shipping_addresses
  resources :billing_addresses
  resources :reviews
  resources :categories do
    resources :products
  end
  resources :orders
  resources :users
  resources :products, only: [:index, :show]

  root 'categories#index'
  post '/login' => 'user_sessions#create'
  get '/check' => 'user_sessions#show'
  delete '/logout' => 'user_sessions#destroy'

  get '/fakeorder' => 'orders#fake_order'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
