require 'rails_helper'

RSpec.describe "donations/edit", type: :view do
  before(:each) do
    @donation = assign(:donation, Donation.create!(
      :amount => 1.5,
      :transaction_state => "MyString",
      :donor_email => "MyString",
      :student_email => "MyString"
    ))
  end

  it "renders the edit donation form" do
    render

    assert_select "form[action=?][method=?]", donation_path(@donation), "post" do

      assert_select "input#donation_amount[name=?]", "donation[amount]"

      assert_select "input#donation_transaction_state[name=?]", "donation[transaction_state]"

      assert_select "input#donation_donor_email[name=?]", "donation[donor_email]"

      assert_select "input#donation_student_email[name=?]", "donation[student_email]"
    end
  end
end
