require 'rails_helper'

RSpec.describe "donations/show", type: :view do
	let(:student){ FactoryGirl.create(:user)} 
	let(:donor){ FactoryGirl.create(:user)}
	before(:each) do
		sign_in donor
		@donation = assign(:donation, Donation.create!(
			:amount => 2.5,
			:transaction_state => "Transaction State",
			:donor_email => "Donor Email",
			:student_email => "Student Email",
			:donor_id => donor[:id],
			:student_id => student[:id]
		))
	end

	it "renders attributes in <p>" do
		render
		expect(rendered).to match(/2.5/)
		expect(rendered).to match(/Transaction State/)
		expect(rendered).to match(/Donor Email/)
		expect(rendered).to match(/Student Email/)
	end
end
