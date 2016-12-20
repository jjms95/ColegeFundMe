require 'rails_helper'

RSpec.describe "parent_children/edit", type: :view do
  before(:each) do
    @parent_child = assign(:parent_child, ParentChild.create!())
  end

  it "renders the edit parent_child form" do
    render

    assert_select "form[action=?][method=?]", parent_child_path(@parent_child), "post" do
    end
  end
end
