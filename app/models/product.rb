class Product < ApplicationRecord
	has_many :orders
	has_many :reviews

	def self.search(search_term)
		Product.where("name LIKE ?", "%#{search_term}%")
	end
end
