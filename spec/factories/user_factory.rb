FactoryGirl.define do
	sequence(:email) {|n| "user#{n}@example.com"}
	sequence(:password) {|n| "password#{n}"}

	factory :user do
		first_name "John"
		last_name "Heggs"
		email
		password
		admin false
	end

	factory :admin, class: User do
		first_name "Jake"
		last_name "Hill"
		email
		password
		admin true
	end
end