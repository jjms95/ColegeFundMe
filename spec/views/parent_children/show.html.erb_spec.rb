require 'rails_helper'

RSpec.describe "parent_children/show", type: :view do
  before(:each) do
    @parent_child = assign(:parent_child, ParentChild.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
