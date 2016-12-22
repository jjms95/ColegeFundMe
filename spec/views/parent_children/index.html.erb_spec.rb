require 'rails_helper'

RSpec.describe "parent_children/index", type: :view do
	let(:child){ FactoryGirl.create(:user)}
	let(:parent){ FactoryGirl.create(:user)}
	
	before(:each) do
		sign_in parent
		assign(:parent_children, [
			ParentChild.create!(	
				:child_id => child[:id],
				:parent_id => parent[:id]
			),
			ParentChild.create!(	
				:child_id => child[:id],
				:parent_id => parent[:id]
			)
		])
	end

	it "renders a list of parent_children" do
		render
	end
end
