require 'rails_helper'

RSpec.describe "parent_children/show", type: :view do
  	let(:child){ FactoryGirl.create(:user)}
	let(:parent){ FactoryGirl.create(:user)}
	
	before(:each) do
		sign_in parent
    	@parent_child = assign(:parent_child, ParentChild.create!(    			
			:child_id => child[:id],
			:parent_id => parent[:id]
    	))
  	end

  	it "renders attributes in <p>" do
    	render
 	end
end
