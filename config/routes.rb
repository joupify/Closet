Rails.application.routes.draw do
  resources :orders
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  resources :stores
  resources :carts
  resources :line_items
  resources :products

  
  
  
  scope '/checkout' do
    get 'show', to: 'checkout#show', as: 'checkout_show'
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'

  end

 

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "stores#index"
  
  get '/', to: 'orders#index'
  post '/orders/submit', to: 'orders#submit'
  
end
