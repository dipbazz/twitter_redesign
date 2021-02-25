require 'rails_helper'

RSpec.describe FollowingsController, type: :controller do
  setup do
    sign_in users(:user1)
  end

  describe 'follower method' do
    it 'is success' do
      get :follower, params: { user_id: users(:user1).id }
      expect(response).to have_http_status 200
    end

    it 'redirects the unauthorize user' do
      sign_out(:user)
      get :follower,  params: { user_id: users(:user1).id }
      expect(response).to have_http_status(302)
    end
  end

  describe 'following method' do
    it 'is success' do
      get :following,  params: { user_id: users(:user1).id }
      expect(response).to have_http_status 200
    end
  end
end
