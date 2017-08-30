require 'rails_helper'

describe UsersController, type: :controller do
	
	before do
		@user = FactoryGirl.create(:user)
		@otherUser = FactoryGirl.create(:admin)
	end

	context 'GET #show' do
		context "User is logged in" do
			before do
				sign_in @user
			end
			it 'loads correct user details' do
				get :show, params: { id: @user.id }
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq @user
			end

			it 'loads other users details' do
				get :show, params: { id: @otherUser.id }
				expect(response).to have_http_status(200)
			end
		end

		context "No user is logged in" do
			it 'redirects to login page' do
				get :show, params: { id: @user.id }
				expect(response).to redirect_to(new_user_session_path)
			end
		end
	end
end