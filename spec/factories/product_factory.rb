FactoryGirl.define do
	sequence(:id) { |n| "#{n}" }

	factory :product do
		id
		name "Thing"
		description "It's a thing"
	end

end