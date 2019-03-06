Rails.application.routes.draw do
  resources :items
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  root 'items#index'

end
