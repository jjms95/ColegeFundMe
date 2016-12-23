require 'rails_helper'
	
describe "selection of role in the first time sign_in" do
	let(:user){ FactoryGirl.create(:user)}
	it "a student sign_in and the page -- is rendered" do
		user.add_role(:student)
		visit "/users/sign_in"
		fill_in "Email", with: user[:email]
    	fill_in "Password", with: user[:password]
    	click_button "Log in"
		expect(page).to have_content("")
	end
end