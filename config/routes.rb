Rails.application.routes.draw do

  get 'carts/show'
  namespace :admin do
    root 'application#index'
    resources :users, only: [:index]
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :comments, only: [:index]
    resources :attendances, only: [:index]
    resources :events, only: [:index]
    resources :orders, only: [:index, :show]
  end
  
  devise_for :users, controller:{ registrations: 'registrations'}
	

	root 'home#index'
  resources :categories, only: [:show]
  resources :tags, only: [:show]
	resources :users, only: [:show]
  resources :order_items
  resources :carts, only: [:show]
  resources :charges
	
  resources :events do
    resources :likes, only: [:create]
    resources :comments, only: [:create]
    resources :attendances, only: [:show]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
