require 'rails_helper'

RSpec.describe "key_donor_children/index", type: :view do
  before(:each) do
    assign(:key_donor_children, [
      KeyDonorChild.create!(),
      KeyDonorChild.create!()
    ])
  end

  it "renders a list of key_donor_children" do
    render
  end
end
