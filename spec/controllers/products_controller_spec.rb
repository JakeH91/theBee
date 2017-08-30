require 'rails_helper'

describe ProductsController, type: :controller do
	before do
		@user = FactoryGirl.create(:user)
		@otherUser = FactoryGirl.create(:user)
		@adminUser = FactoryGirl.create(:admin)
		@product = FactoryGirl.create(:product)
	end

	context "GET #index" do
		it "should render index page" do
			get :index
			expect(response).to render_template('index')
		end
	end

	context "DELETE #destroy" do
		context "Admin signed in" do
			before do
				sign_in @adminUser
			end
			it "should delete product" do
				delete :destroy, params: {id: @product}
				expect(response).to redirect_to products_path
			end
		end

		context "Non-admin signed in" do
			before do
				sign_in @user
			end
			it "should not delete product" do
				delete :destroy, params: {id: @product}
				expect(response).to redirect_to root_path
			end
		end
	end
end