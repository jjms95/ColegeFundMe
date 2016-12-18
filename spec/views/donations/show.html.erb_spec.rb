require 'rails_helper'

RSpec.describe "donations/show", type: :view do
  before(:each) do
    @donation = assign(:donation, Donation.create!(
      :amount => 2.5,
      :transaction_state => "Transaction State",
      :donor_email => "Donor Email",
      :student_email => "Student Email"
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
