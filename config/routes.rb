Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :shipping_addresses
  resources :billing_addresses
  resources :reviews
  resources :categories do
    resources :products
  end

  resources :orders, only: [:show]
  resources :users
  resources :charges
  resources :orderings, only: [:create, :update, :destroy]
  resources :products, only: [:index, :show]


  get '/order' => 'orders#show'
  root 'categories#index'
  post '/login' => 'user_sessions#create'
  get '/check' => 'user_sessions#show'
  delete '/logout' => 'user_sessions#destroy'

  get '/fakeorder' => 'orders#fake_order'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
