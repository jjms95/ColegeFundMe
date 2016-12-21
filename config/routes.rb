Rails.application.routes.draw do
  
	#roots
	
	root to: 'donations#index', 
	constraints: lambda { |request| !request.env['warden'].user}

	root to: 'donations#index',
	constraints: lambda { |request| request.env['warden'].user.student? }

	root to: 'donations#index', as: 'customer_root',
	constraints: lambda { |request| request.env['warden'].user.parent? }

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
end
