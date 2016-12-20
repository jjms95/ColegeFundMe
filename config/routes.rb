Rails.application.routes.draw do
  resources :parent_children
  	#roots
  	root to: 'donations#index'
  	
	root to: 'donations#index', 
	constraints: lambda { |request| !request.env['warden'].user.normal?}

	root to: 'donations#index',
	constraints: lambda { |request| request.env['warden'].user.student? }

	root to: 'donations#index', as: 'customer_root',
	constraints: lambda { |request| request.env['warden'].user.parent? }

	#devise
  	devise_for :users 
  	as :user do
  		resources :donations
  	end
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
