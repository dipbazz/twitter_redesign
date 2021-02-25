require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  setup do
    sign_in users(:user1)
  end

  describe 'create method' do
    it 'successfull response' do
      post :create, params: { opinion_id: opinions(:opinion2) }
      expect(flash[:notice]).to eq('You liked an opinion.')
    end

    it 'alert with error for invalid data' do
      post :create, params: { opinion_id: opinions(:opinion1) }
      expect(flash[:alert]).to eq('You cannot like this opinion.')
    end

    it 'redirects the unauthorize user' do
      sign_out(:user)
      post :create, params: { opinion_id: opinions(:opinion2) }
      expect(response).to have_http_status(302)
    end
  end

  describe 'destroy method' do
    it 'successfully destroy the like' do
      post :destroy, params: { id: likes(:user1_likes_opinion1).id, opinion_id: opinions(:opinion1) }
      expect(flash[:notice]).to eq('You disliked an opinion.')
    end

    it 'alert with error for unavailable data' do
      post :destroy, params: { id: 4, opinion_id: opinions(:opinion2) }
      expect(flash[:alert]).to eq('You cannot dislike opinion that you did not like before.')
    end
  end
end
