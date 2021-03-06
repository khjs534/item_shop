Rails.application.routes.draw do
  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'
  resources :orders

  resources :items
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :users, only: [:show]
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  root 'items#index'

end
