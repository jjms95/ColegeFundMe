require 'rails_helper'

RSpec.describe "parent_children/index", type: :view do
  before(:each) do
    assign(:parent_children, [
      ParentChild.create!(),
      ParentChild.create!()
    ])
  end

  it "renders a list of parent_children" do
    render
  end
end
