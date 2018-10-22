Rails.application.routes.draw do
	root to: "restaurants#index"
  devise_for :users
  resources :users 
  resources :restaurants
  namespace :owners do
  	resources :restaurants
  end
	resources :menu_items
	resources :reviews
  resources :carts
  resources :orders do
    collection do
      get 'send_order_history'
    end
  end
  resources :items
end
