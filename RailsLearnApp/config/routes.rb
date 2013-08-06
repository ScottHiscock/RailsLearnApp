Eshop::Application.routes.draw do
  get "sessions/new"
  get "users/new"
	get "home/index"

  root :to => 'home#index'
	match 'contact' => 'home#contact'
	match 'eshop' => 'eshop#index'
	get "kategorie/:id" => "backend/categories#show"
	
	# Auth
	get "sign_up" => "users#new", :as => "sign_up"
	get "log_in" => "sessions#new", :as => "log_in"
	get "log_out" => "sessions#destroy", :as => "log_out"

	root :to => "home#index"
	resources :users
	resources :sessions
	# konec Auth
	
	# Backend Auth
	match "backend/signup" => "backend/employees#new"
	match "backend/login" => "backend/admin#show_login", :via => :get
	match "backend/login" => "backend/admin#login", :via => :post
	match "backend/logout" => "backend/admin#logout"
	#match "backend/employee/new" => "backend/admin/sessions#destroy"
	# konec Backend Auth
	
	# BACKEND
	namespace :backend do
    root to: "admin#index"
    resources :admin, :categories, :products, :employees, :sessions
  end
	
	#match 'backend/category' => 'admin#category'
	#match 'backend/category' => 'admin/categories#list'
	
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
