require 'rails_helper'

RSpec.describe KeyDonorChild, type: :model do
	it {should belong_to(:key_donor)}
	it {should belong_to(:child)}
end
