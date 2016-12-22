require 'rails_helper'
	
describe "selection of role in the first time sign_in" do
	let(:user){ FactoryGirl.create(:user)}
	let(:student){"student"}
	before do
		login_as(user, :scope => :user)   
	end
	it "a student create a account and redirects to home page" do
		visit "/assign_roles/first_sign"
		click_link "Yes, i am student"
		expect(page).to have_content("Welcome to fundme new student.")
	end
	it "a donor/parent create a account and redirects to home page" do
		visit "/assign_roles/first_sign"
		click_link "Not, i am not student"
		expect(page).to have_content("Welcome to fundme new donor/parent.")
	end
end