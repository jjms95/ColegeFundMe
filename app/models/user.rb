class User < ApplicationRecord
	rolify
	devise :database_authenticatable, :registerable,
			:recoverable, :rememberable, :trackable, :validatable
	after_create :assign_default_role
	#donor side of the relationship
	has_many :maked_donations, :class_name => 'Donation', :foreign_key => 'donor_id'
  	#student side of the ralationship
  	has_many :recieved_donations, :class_name => 'Donation', :foreign_key => 'student_id'
  	#child side of the relationship
  	has_one :child_parent_child, :class_name => 'ParentChild', :foreign_key => 'child_id'
  	has_one :parent, :class_name => 'User', :foreign_key => 'id',through: :child_parent_child
  	#parent side of the relationship
  	has_many :parent_parent_child, :class_name => 'ParentChild', :foreign_key => 'parent_id'
  	has_many :childs, :class_name => 'User', :foreign_key => 'id',through: :parent_parent_child
	
	#methods
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
