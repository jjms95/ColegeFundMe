require 'rails_helper'

RSpec.describe "parent_children/new", type: :view do
  before(:each) do
    assign(:parent_child, ParentChild.new())
  end

  it "renders new parent_child form" do
    render

    assert_select "form[action=?][method=?]", parent_children_path, "post" do
    end
  end
end
