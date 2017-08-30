require "rails_helper"

describe Comment do 
	context "when leaving new comment on product" do
		let(:user) { User.new(id: 1, first_name: "Jake", last_name: "Hill", email: "test@email.com" ) }
		let(:product) { Product.new(name: "Thing", description: "It's a thing") }
		
		it "is valid with all variables" do
			expect(product.comments.new(user: user, body: "Nice", rating: 3)).to be_valid
		end

		it "is invalid without rating" do
			expect(product.comments.new(user: user, body: "Nice")).not_to be_valid
		end

		it "is invalid without text" do
			expect(product.comments.new(user: user, rating: 3)).not_to be_valid
		end

		it "is invalid without user" do
			expect(product.comments.new(body: "Nice", rating: 3)).not_to be_valid
		end
	end
end