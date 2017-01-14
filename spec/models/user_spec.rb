require 'rails_helper'

RSpec.describe User, type: :model do
	#donations relationship
  	it {should have_many(:maked_donations)}
  	it {should have_many(:received_donations)}
  	#parent_child relationship
  	##like child
  	it {should have_one(:parent_of_child).through(:child_parent_child)}
	it {should have_one(:child_parent_child)}
	##like parent
	it {should have_many(:childs_of_parent).through(:parent_parent_children)}
	it {should have_many(:parent_parent_children)}
	#key_donor_child relationship
	##like child
	it {should have_many(:key_donors_of_child).through(:child_key_donor_children)}
	it {should have_many(:child_key_donor_children)}
	##like key_donor
	it {should have_many(:childs_of_key_donor).through(:donor_key_donor_children)}
	it {should have_many(:donor_key_donor_children)}
end
