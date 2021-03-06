require 'rails_helper'

RSpec.describe "parent_children/edit", type: :view do
	let(:child){ FactoryGirl.create(:user)}
	let(:parent){ FactoryGirl.create(:user)}
	
	before(:each) do
		sign_in parent 
		@parent_child = assign(:parent_child, ParentChild.create!(			
			:child_id => child[:id],
			:parent_id => parent[:id]
		))
	end

	it "renders the edit parent_child form" do
		render

		assert_select "form[action=?][method=?]", parent_child_path(@parent_child), "post" do
			
		end
	end
end
