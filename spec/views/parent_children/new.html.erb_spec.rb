require 'rails_helper'

RSpec.describe "parent_children/new", type: :view do
  	let(:child){ FactoryGirl.create(:user)}
	let(:parent){ FactoryGirl.create(:user)}
	
	before(:each) do
		sign_in parent
    	assign(:parent_child, ParentChild.new(		
			:child_id => child[:id],
			:parent_id => parent[:id]
			))
  	end

  	it "renders new parent_child form" do
    	render

    	assert_select "form[action=?][method=?]", parent_children_path, "post" do
    		
    	end
  end
end
