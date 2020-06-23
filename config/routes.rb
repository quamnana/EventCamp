Rails.application.routes.draw do

  namespace :admin do
    root 'application#index'
    resources :users, only: [:index]
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :comments, only: [:index]
    resources :attendances, only: [:index]
    resources :events, only: [:index]
  end
  
  devise_for :users, controller:{ registrations: 'registrations'}
	

	root 'home#index'
  resources :categories, only: [:show]
  resources :tags, only: [:show]
	resources :users, only: [:show]

	
  resources :events do
    resources :likes, only: [:create]
    resources :comments, only: [:create]
    resources :attendances, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
