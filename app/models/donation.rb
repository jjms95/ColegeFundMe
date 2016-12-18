class Donation < ApplicationRecord
	belongs_to :donor, :class_name => 'User'
  	belongs_to :student, :class_name => 'User'
  	validates :amount, presence: true
  	validates :donor_email, presence: true
  	validates :student_email, presence: true
  	validates :transaction_state, presence: true
  	validates :student_id, presence: true
  	validates :donor_id, presence: true
end
