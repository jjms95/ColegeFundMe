Rails.application.routes.draw do
  
  get 'search/create'

  resources :key_donor_children
	#root
	authenticated :user_donor do
    	root :to => "main#dashboard"
    	# Rails 4 users must specify the 'as' option to give it a unique name
    	# root :to => "main#dashboard", :as => "authenticated_root"
  	end
	root to: 'static_pages#home', 
	constraints: lambda { |request| !request.env['warden'].user}

	#devise
	devise_for :users, controllers: { registrations: "users/registrations",sessions:"users/sessions" ,omniauth_callbacks: 'users/omniauth_callbacks'}
	as :user do
		resources :donations,only:[:new,:index,:show,:destroy,:update,:create]
		resources :parent_children, only:[:new,:index,:show,:destroy,:update,:create]
	end

	#resourses
	resources :users

	#individual routes
	get '/assign_roles/first_sign', to: 'assign_roles#first_sign', as: 'first_sign'
	get '/assign_roles/save_role', to: 'assign_roles#save_role', as: 'save_role'
	get '/static_pages/home', to: 'static_pages#home', as: 'home'

	#multiple account
	match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
end
