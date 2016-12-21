require 'rails_helper'

RSpec.describe "donations/index", type: :view do
	let(:student){ FactoryGirl.create(:user)} 
	let(:donor){ FactoryGirl.create(:user)}
	before(:each) do		
		sign_in donor
		assign(:donations, [
		   	Donation.create!(
				:amount => 2.5,
				:transaction_state => "Transaction State",
				:donor_email => "Donor Email",
				:student_email => "Student Email",
				:donor_id => donor[:id],
				:student_id => student[:id]
		 	 ),
		  	Donation.create!(
				:amount => 2.5,
				:transaction_state => "Transaction State",
				:donor_email => "Donor Email",
				:student_email => "Student Email",
				:donor_id => donor[:id],
				:student_id => student[:id]
		  	)
		])
	end

	it "renders a list of donations" do
		render
		assert_select "tr>td", :text => 2.5.to_s, :count => 2
		assert_select "tr>td", :text => "Transaction State".to_s, :count => 2
		assert_select "tr>td", :text => "Donor Email".to_s, :count => 2
		assert_select "tr>td", :text => "Student Email".to_s, :count => 2
	end
end
