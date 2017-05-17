Rails.application.routes.draw do
  root 'welcome#index'

  resources :users
  resources :sessions

  delete 'logout' => 'sessions#destroy', as: :logout

  resources :categories,only:[:show]
  resources :products,only: [:show] do

    get :search, on: :collection

  end

  resources :shopping_carts
  resources :addresses do
    member do
      put :set_default_address
    end
  end
  
  resources :orders


  #管理平台都是独立放在admin命名空间里了
  namespace :admin do
  	root 'sessions#new'
  	resources :sessions
  	resources :categories
    resources :products do
        resources :product_images, only:[:index, :create, :destroy, :update]
    end

  end


end
