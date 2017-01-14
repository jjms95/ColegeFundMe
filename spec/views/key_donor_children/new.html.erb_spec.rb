require 'rails_helper'

RSpec.describe "key_donor_children/new", type: :view do
  before(:each) do
    assign(:key_donor_child, KeyDonorChild.new())
  end

  it "renders new key_donor_child form" do
    render

    assert_select "form[action=?][method=?]", key_donor_children_path, "post" do
    end
  end
end
