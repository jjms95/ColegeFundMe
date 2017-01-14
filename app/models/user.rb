class User < ApplicationRecord
	TEMP_EMAIL_PREFIX = 'change@me'
  	TEMP_EMAIL_REGEX = /\Achange@me/
	rolify
	devise :database_authenticatable, :registerable,
			:recoverable, :rememberable, :trackable, :validatable, :omniauthable
	after_create :assign_default_role
	
	#donations relationships
	##donor side of the relationships
	has_many :maked_donations, :class_name => 'Donation', :foreign_key => 'donor_id'
	##student side of the ralatioships
	has_many :received_donations, :class_name => 'Donation', :foreign_key => 'student_id'
	
	#parent_child relationships	
	##child side of the relationship
	has_one :child_parent_child,:class_name => 'ParentChild', :foreign_key => 'child_id'
	has_one :parent_of_child, :class_name => 'User', :foreign_key => 'id',through: :child_parent_child
	##parent side of the relationship
	has_many :parent_parent_children,:class_name => 'ParentChild', :foreign_key => 'parent_id'
	has_many :childs_of_parent, :class_name => 'User', :foreign_key => 'id',through: :parent_parent_children
	
	#key_donor_child relationships
	##child side of the relationship
	has_many :child_key_donor_children,:class_name => 'KeyDonorChild', :foreign_key => 'child_id'
	has_many :key_donors_of_child, :class_name => 'User', :foreign_key => 'id',through: :child_key_donor_children
	##parent side of the relationship
	has_many :donor_key_donor_children,:class_name => 'KeyDonorChild', :foreign_key => 'key_donor_id'
	has_many :childs_of_key_donor, :class_name => 'User', :foreign_key => 'id',through: :donor_key_donor_children

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
	def home_page_user
		if self.child? or self.parent?
			'/parent_children'
		elsif self.student? or self.donor?
			'/donations'
		elsif self.admin?
		end 
	end

	#multiple account
	validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

	def self.find_for_oauth(auth, signed_in_resource = nil)
		identity = Identity.find_for_oauth(auth)
		user = signed_in_resource ? signed_in_resource : identity.user

		if user.nil?

			email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
			email = auth.info.email if email_is_verified
			user = User.where(:email => email).first if email

			if user.nil?
				user = User.new(
					password: Devise.friendly_token[0,20],
					password_confirmation: password,
					first_name: auth.extra.raw_info.first_name,
					last_name: auth.extra.raw_info.last_name,
					birthdate: auth.extra.raw_info.birthday,
					username: auth.info.nickname || auth.uid,
					email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com"
					
				)
				user.save!
			end
		end

		# Associate the identity with the user if needed
		if identity.user != user
			identity.user = user
			identity.save!
		end
		user
	end

	def email_verified?
		self.email && self.email !~ TEMP_EMAIL_REGEX
	end

end
