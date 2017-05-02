class Product < ApplicationRecord
	has_many :orders
	has_many :reviews

	def self.search(search_term)
		if Rails.env.development?
			Product.where("name LIKE ?", "%#{search_term}%")
		elsif Rails.env.production?
			Product.where("name ilike ?", "%#{search_term}%")
		end
	end
end
