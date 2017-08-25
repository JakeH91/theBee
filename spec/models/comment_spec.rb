require "rails_helper"

describe Comment do 
	context "rating absent" do
		it "is invalid" do
			expect(Comment.new(body: "Nice")).not_to be_valid
		end
	end
end