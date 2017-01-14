require 'rails_helper'

RSpec.describe "key_donor_children/show", type: :view do
  before(:each) do
    @key_donor_child = assign(:key_donor_child, KeyDonorChild.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
