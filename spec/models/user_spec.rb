require 'rails_helper'

RSpec.describe User, type: :model do
  	it {should have_many(:recieved_donations)}
  	it {should have_many(:maked_donations)}
  	it {should have_one(:parent).through(:child_parent_child)}
	it {should have_one(:child_parent_child)}
	it {should have_many(:childs).through(:parent_parent_child)}
	it {should have_many(:parent_parent_child)}
end
