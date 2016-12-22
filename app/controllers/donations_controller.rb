class DonationsController < ApplicationController
  	before_action :set_donation, only: [:show, :edit, :update, :destroy]
  	before_action :authenticate_user!
  	# GET /donations
  	# GET /donations.json
  	def index
		@donations = current_user.maked_donations
		@students = current_user.childs
 	end

  	# GET /donations/1
  	# GET /donations/1.json
  	def show
  	end

  	# GET /donations/new
  	def new
		@donation = current_user.maked_donations.new
 	end

  	# GET /donations/1/edit
  	def edit
  	end

  	# POST /donations
  	# POST /donations.json
  	def create
  		@donation = current_user.maked_donations.new(donation_params)
		respond_to do |format|
	  		if @donation.save
	  			user = User.find(@donation[:student_id])
	  			user.add_role :student,@donation
	  			current_user.add_role :donor,@donation
				format.html { redirect_to @donation, notice: 'Donation was successfully created.' }
				format.json { render :show, status: :created, location: @donation }
	  		else
				format.html { render :new }
				format.json { render json: @donation.errors, status: :unprocessable_entity }
	  		end
		end
 	end

  	# PATCH/PUT /donations/1
  	# PATCH/PUT /donations/1.json
  	def update
		respond_to do |format|
	  		if @donation.update(donation_params)
				format.html { redirect_to @donation, notice: 'Donation was successfully updated.' }
				format.json { render :show, status: :ok, location: @donation }
	 		else
				format.html { render :edit }
				format.json { render json: @donation.errors, status: :unprocessable_entity }
	  		end
		end
  	end

  	# DELETE /donations/1
  	# DELETE /donations/1.json
  	def destroy
		@donation.destroy
		respond_to do |format|
			
	  		format.html { redirect_to donations_url, notice: 'Donation was successfully destroyed.' }
	  		format.json { head :no_content }
		end
  	end

  	private
	# Use callbacks to share common setup or constraints between actions.
	def set_donation
	  	@donation = current_user.maked_donations.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def donation_params
	  	params.require(:donation).permit(:amount, :transaction_state, :donor_email, :student_email,:donor_id,:student_id)
	end
end
