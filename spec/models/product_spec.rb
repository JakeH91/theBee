require "rails_helper"

describe Product do
	context "when making new product" do
		it "is invalid without name" do
			expect(Product.new(description: "Very lovely little hat")).not_to be_valid
		end
	end

	context "when the product has comments" do
		before do
			@product = Product.create!(name: "Race Bike")
			@user = FactoryGirl.create(:user)
			@product.comments.create!(rating: 1, user: @user, body: "Bloody awful bike!")
			@product.comments.create!(rating: 3, user: @user, body: "Yeah it's not too bad, all things considered")
			@product.comments.create!(rating: 5, user: @user, body: "Myyyy goodness I love this thing!")
		end

		it "returns average rating of all comments" do
			expect(@product.average_rating).to eq 3
		end
	end
end

