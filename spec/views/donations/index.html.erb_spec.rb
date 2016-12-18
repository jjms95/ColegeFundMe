require 'rails_helper'

RSpec.describe "donations/index", type: :view do
  before(:each) do
    assign(:donations, [
      Donation.create!(
        :amount => 2.5,
        :transaction_state => "Transaction State",
        :donor_email => "Donor Email",
        :student_email => "Student Email"
      ),
      Donation.create!(
        :amount => 2.5,
        :transaction_state => "Transaction State",
        :donor_email => "Donor Email",
        :student_email => "Student Email"
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
