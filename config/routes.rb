Rails.application.routes.draw do
  resources :categories
  resources :order_details
  resources :orders
  resources :items
  resources :customers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
