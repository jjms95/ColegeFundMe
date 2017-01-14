require 'rails_helper'

RSpec.describe "key_donor_children/edit", type: :view do
  before(:each) do
    @key_donor_child = assign(:key_donor_child, KeyDonorChild.create!())
  end

  it "renders the edit key_donor_child form" do
    render

    assert_select "form[action=?][method=?]", key_donor_child_path(@key_donor_child), "post" do
    end
  end
end
