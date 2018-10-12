Rails.application.routes.draw do
  
  #devise_for :users
  devise_for :users
  root to: "users#index"
  get 'access/signin'

  get 'access/signup'

  get 'access/partner'

   
  resources :users
  resources :restaurants
  resources :menu_items
  resources :items
  resources :reviews
  resources :orders do 
    get 'display', on: :collection
  end
  
  resources :currents 


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
