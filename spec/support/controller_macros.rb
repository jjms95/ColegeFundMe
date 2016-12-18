module ControllerMacros
	def login_user
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			user = FactoryGirl.create(:student)
			sign_in user
		end
	end
	def create_user(type_user) 
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			if type_user=="student"
				user = FactoryGirl.create(:student)
			else type_user=="donor"
				user = FactoryGirl.create(:donor)
			end
		end
	end
end