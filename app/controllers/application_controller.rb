class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception
  	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :configure_account_update_params, if: :devise_controller?
  
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:username,:birthdate])
	end
	def configure_account_update_params
		devise_parameter_sanitizer.permit(:account_update, keys: [:first_name,:last_name,:username,:birthdate])
	end
end
