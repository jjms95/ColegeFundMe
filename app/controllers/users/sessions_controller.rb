class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

	# GET /resource/sign_in
	# def new
	#   super
	# end

	# POST /resource/sign_in
	def create
		self.resource = warden.authenticate!(auth_options)
			set_flash_message!(:notice, :signed_in)
			sign_in(resource_name, resource)
			yield resource if block_given?
		if current_user
			if !current_user.student? and !current_user.donor?
				redirect_to first_sign_path
			elsif current_user.parent?
				redirect_to parent_children_path
			elsif current_user.student? or current_user.donor?
				redirect_to donations_path
			end
		end
	end

	# DELETE /resource/sign_out
	# def destroy
	#   super
	# end

	# protected

	# If you have extra params to permit, append them to the sanitizer.
	# def configure_sign_in_params
	#   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
	# end
end
