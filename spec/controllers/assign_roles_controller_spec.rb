require 'rails_helper'

RSpec.describe AssignRolesController, type: :controller do
	let(:user){ FactoryGirl.create(:user)}
	let(:student){"student"}
	before do
		sign_in user   
	end
	describe "get first_sign" do
		it "should render the template for the selection of role" do
			get :first_sign
			expect(response).to render_template("first_sign") 
		end
	end
	describe "post save_role" do
		it "add the role to the user" do			
			get :save_role,params:{type:student}
			user.reload
			expect(student).to eq(user.roles.last[:name]) 
		end
	end
end
