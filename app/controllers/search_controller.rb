class SearchController < ApplicationController
  	before_action :authenticate_user!

	def create
		@users = User.where("email LIKE ? OR username LIKE ?",params[:keyword],params[:keyword])
		respond_to do |format|
			format.html { redirect_to new_parent_child_path }
			format.json { render json: @users }
			format.js
		end				
	end

	private
	def search_params
	  	params.require(:search).permit(:keyword)
	end
end
