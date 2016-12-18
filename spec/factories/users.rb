FactoryGirl.define do
  	factory :user do
    	email { Faker::Internet.email }
		password {"password"}
		password_confirmation {"password"}
		first_name {Faker::Name.first_name}
		last_name {Faker::Name.last_name}
		username {Faker::Internet.user_name}
		birthdate {Faker::Date.between(90.year.ago, 13.year.ago)}
  	end
end
