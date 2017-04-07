class Product < ApplicationRecord
	has_many :orders
	has_many :reviews
end
