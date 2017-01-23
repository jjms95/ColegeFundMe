class ParentChildrenController < ApplicationController
  	before_action :set_parent_child, only: [:show, :edit, :update, :destroy]
  	before_action :authenticate_user!
  	# GET /parent_children
  	# GET /parent_children.json
  	def index  		
  		if current_user.donor?
  			@parent_child=current_user.parent_parent_children.all
  		else
  			@parent_child=current_user.child_parent_child
  		end
 	end

  	# GET /parent_children/1
  	# GET /parent_children/1.json
  	def show
  	end

  	# GET /parent_children/new
  	def new
  		if current_user.donor?
  			@parent_child=current_user.parent_parent_children.new
  		else
  			@parent_child=current_user.build_child_parent_child
  		end
 	end

  	# GET /parent_children/1/edit
  	def edit
  	end

  	# POST /parent_children
  	# POST /parent_children.json
  	def create
  		if current_user.donor?
			@parent_child = current_user.parent_parent_children.new(parent_child_params)
		else
			@parent_child=current_user.build_child_parent_child(parent_child_params)
		end

		respond_to do |format|
	  		if @parent_child.save
	  			user=User.find(@parent_child[:child_id])
	  			if current_user.student?
	  				user.add_role :parent
	  				current_user.add_role :child
	  				user.add_role :parent,@parent_child
	  				current_user.add_role :child,@parent_child
	  			else
	  				user.add_role :child
	  				current_user.add_role :parent
	  				user.add_role :child,@parent_child
	  				current_user.add_role :parent,@parent_child
	  			end
				format.html { redirect_to @parent_child, notice: 'Parent child was successfully created.' }
				format.json { render :show, status: :created, location: @parent_child }
	  		else
				format.html { render :new }
				format.json { render json: @parent_child.errors, status: :unprocessable_entity }
	  		end
		end
  	end

  	# PATCH/PUT /parent_children/1
  	# PATCH/PUT /parent_children/1.json
  	def update
		respond_to do |format|
	  		if @parent_child.update(parent_child_params)
				format.html { redirect_to @parent_child, notice: 'Parent child was successfully updated.' }
				format.json { render :show, status: :ok, location: @parent_child }
	  		else
				format.html { render :edit }
				format.json { render json: @parent_child.errors, status: :unprocessable_entity }
	  		end
		end
  	end

  	# DELETE /parent_children/1
  	# DELETE /parent_children/1.json
  	def destroy
		@parent_child.destroy
		respond_to do |format|
	  		format.html { redirect_to parent_children_url, notice: 'Parent child was successfully destroyed.' }
	  		format.json { head :no_content }
		end
  	end

  	private
	# Use callbacks to share common setup or constraints between actions.
	def set_parent_child
	 	@parent_child = ParentChild.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def parent_child_params
	  	params.require(:parent_child).permit(:child_id,:parent_id,:parent_email,:child_email,:parent_name,:child_name)
	end
end
