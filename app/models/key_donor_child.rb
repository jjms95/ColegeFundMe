class KeyDonorChild < ApplicationRecord
	belongs_to :key_donor, :class_name => 'User'
  	belongs_to :child, :class_name => 'User'
end
