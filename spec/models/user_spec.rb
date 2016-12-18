require 'rails_helper'

RSpec.describe User, type: :model do
  	it {should have_many(:recieved_donations)}
  	it {should have_many(:maked_donations)}
end
