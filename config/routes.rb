Rails.application.routes.draw do
  root 'orders#new'
  resources :orders, only: [:create]
  get 'kitchen', to: 'orders#kitchen'
end
