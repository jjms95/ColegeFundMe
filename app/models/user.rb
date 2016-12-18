class User < ApplicationRecord
	rolify
	devise :database_authenticatable, :registerable,
			:recoverable, :rememberable, :trackable, :validatable
	after_create :assign_default_role
	has_many :maked_donations, :class_name => 'Donation', :foreign_key => 'donor_id'
  	has_many :recieved_donations, :class_name => 'Donation', :foreign_key => 'student_id'
	def assign_default_role
		self.add_role(:normal) if self.roles.blank?
	end
	def admin?
		self.has_role? :admin    
	end
	def student?
		self.has_role? :student
	end
	def child?
		self.has_role? :child
	end 
	def parent?
		self.has_role? :parent
	end
	def donor?
		self.has_role? :donor
	end
	def key_donor?
		self.has_role? :keyDonor
	end	
	def normal?
		self.has_role? :normal
	end

end
