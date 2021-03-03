require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  setup do
    sign_in users(:user1)
  end

  describe 'show method' do
    it 'successfull response' do
      get :show, params: { id: users(:user1) }
      expect(response).to have_http_status(200)
    end

    it 'redirects the unauthorize user' do
      sign_out(:user)
      get :show, params: { id: users(:user1) }
      expect(response).to have_http_status(302)
    end
  end

  describe 'follow user' do
    it 'successfully follows the user' do
      post :follow, params: { id: users(:user3) }
      expect(flash[:notice]).to eq("You are now following @#{users(:user3).username}.")
    end

    it 'error when tries to follow the same user' do
      post :follow, params: { id: users(:user2) }
      expect(flash[:alert]).to eq('Something went wrong while trying to follow the user.')
    end
  end

  describe 'unfollow user' do
    it 'is successfull' do
      post :unfollow, params: { id: users(:user2) }
      expect(flash[:alert]).to eq("You have unfollowed @#{users(:user2).username}.")
    end

    it 'has error if tries to unfollow the user who is not yet followed' do
      post :unfollow, params: { id: users(:user3) }
      expect(flash[:alert]).to eq('Something went wrong while trying to unfollow the user.')
    end
  end

  describe 'follows?' do
    it 'checks for followed user' do
      expect(users(:user1).follows?(users(:user2))).to be true
    end

    it 'checks for unfollowed user' do
      expect(users(:user1).follows?(users(:user3))).to be false
    end
  end
end
