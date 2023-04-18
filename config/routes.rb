Rails.application.routes.draw do
  root 'orders#new'
  resources :orders, only: [:create]
  get 'kitchen', to: 'orders#kitchen'

  resources :orders do
    collection do
      get :kitchen
      get :kitchen_json
    end
  end
end
