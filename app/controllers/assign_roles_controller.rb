class AssignRolesController < ApplicationController
	before_action :authenticate_user!
	
	def first_sign
	end
	
	def save_role
		if params[:type]=="student"
			current_user.add_role(:student)
			flash[:success] = "Welcome to fundme new student."
      		redirect_to donations_path
		else
			current_user.add_role(:donor)
			flash[:success] = "Welcome to fundme new donor/parent."
      		redirect_to donations_path
		end	
	end

	private
	# Never trust parameters from the scary internet, only allow the white list through.
	def role_params
	  	params.permit(:type)
	end
end
