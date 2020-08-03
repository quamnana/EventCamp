Rails.application.routes.draw do

 
  namespace :admin do
    root 'application#index'
    resources :users, only: [:index]
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :comments, only: [:show]
    resources :attendances, only: [:show]
    resources :events, only: [:index]
    resources :orders, only: [:index, :show]
  end
  
  devise_for :users, controller:{ 
                                  registrations: 'registrations', 
                                  confirmations: 'confirmations'
                                }
	

	root 'home#index'
  resources :categories, only: [:show]
  resources :tags, only: [:show]
	resources :users, only: [:show]
  resources :order_items
  resources :charges
  resources :orders, only: [:show]
  resources :carts, only: [:show]
  resources :reciepts, only: [:show]

   get 'carts/show'
   get 'reciepts/show'
  
  resources :events do
    resources :likes, only: [:create]
    resources :comments, only: [:create]
    resources :attendances, only: [:create, :show]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
