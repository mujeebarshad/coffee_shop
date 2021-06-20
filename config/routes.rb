Rails.application.routes.draw do
  devise_for :users

  get 'home/index'
  devise_for :views
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get 'users/new_customer' => 'users/new_customer'
  post 'users/create_customer' => 'users/create_customer'
  get 'users/list_customers' => 'users/list_customers'

  resources :items, only: %i[new create index]

  resources :orders, only: %i[create index]
  get 'orders/process_order/:id', to: 'orders#process_order'
  post 'orders/remove_order/:id', to: 'orders#remove_order'
end
