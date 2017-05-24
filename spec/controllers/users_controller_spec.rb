require 'rails_helper'

describe UsersController, type: :controller do
	
	#let(:user) { User.create!(email: 'peter@example.com', password: '1234567890') }
	#let(:otherUser) { User.create!(email: 'someone@else.com', password: '0987654321') }
	
	before do
		@user = User.create!(email: 'peter@example.com', password: '1234567890')
		@otherUser = User.create!(email: 'someone@else.com', password: '0987654321')
	end

	describe 'GET #show' do
		context "User is logged in" do
			before do
				sign_in @user
			end
			it 'loads correct user details' do
				get :show, id: @user.id
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq @user
			end

			it 'does not load other users details' do
				get :show, id: @otherUser.id
				expect(response).to have_http_status(302)
				expect(response).to redirect_to(root_path)
			end
		end

		context "No user is logged in" do
			it 'redirects to homepage' do
				get :show, id: @user.id
				expect(response).to redirect_to(root_path)
			end
		end
	end
end