Rails.application.routes.draw do
  root to: "public/orders#top"

  namespace :admin do
    get 'products/admin/orders'
  end
  namespace :admin do
    get 'users/products'
  end
  devise_for :admins
  devise_for :users

  namespace :admin do
  	resources :genres, only: [:index,:create,:edit,:update]
  	resources :users, only: [:index,:edit,:show,:update]
  	resources :products, only: [:index,:create,:show,:new,:edit,:update]
  	resources :orders, only: [:index,:show,:update]
  	get "top"  => "orders#top"
  end

  namespace :public do
	resource :users, only: [:create, :show, :edit, :update]
	get "/users/confirm"  => "users#confirm"
	patch "/users/confirm" => "users#update"
	resources :products, only: [:index, :show]
	resources :orders, only: [:index, :show, :new, :create]
	get "/orders/confirm"  => "orders#confirm"
	post "/orders"  => "orders#create"
	get "/orders/thanks"  => "users#thanks"
	resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
	resources :cart_items, only: [:create, :index, :update, :destroy]
	delete "/cart_items"  => "cart_items#destroy"
	get "about" => "order#about"
  end
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
