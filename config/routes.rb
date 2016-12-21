Rails.application.routes.draw do
  
	#root
	
	root to: 'static_pages#home', 
	constraints: lambda { |request| !request.env['warden'].user}

	#devise
	devise_for :users, controllers: { registrations: "users/registrations",sessions:"users/sessions" }
	as :user do
		resources :donations
		resources :parent_children
	end

	#resourses

	#individual routes
	get '/assign_roles/first_sign', to: 'assign_roles#first_sign', as: 'first_sign'
	get '/assign_roles/save_role', to: 'assign_roles#save_role', as: 'save_role'
	get '/static_pages/home', to: 'static_pages#home', as: 'home'
end
