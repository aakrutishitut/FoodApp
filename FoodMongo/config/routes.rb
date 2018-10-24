Rails.application.routes.draw do
	root to: "restaurants#index"
  devise_for :users
  resources :users 
  resources :restaurants do 
    resources :reviews
  end
  namespace :owners do
  	resources :restaurants
  end
	resources :menu_items
  resources :carts
  resources :orders do
    collection do
      get 'send_order_history'
    end
  end
  resources :items
end
