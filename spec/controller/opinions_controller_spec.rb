require 'rails_helper'

RSpec.describe OpinionsController, type: :controller do
  setup do
    sign_in users(:user1)
  end

  describe 'index method' do
    it 'is success' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'redirects the unauthorize user' do
      sign_out(:user)
      get :index
      expect(response).to have_http_status(302)
    end
  end

  describe 'show method' do
    it 'is success' do
      get :show, params: { id: opinions(:opinion1) }
      expect(response).to have_http_status(200)
    end
  end

  describe 'create method' do
    it 'is success' do
      post :create, params:  { opinion: { text: 'this is a test opinion.' } }
      expect(flash[:notice]).to eq('Your opinion has been created.')
    end

    it 'has error with invalid text' do
      post :create, params: { opinion: { text: '' } }
      expect(flash[:alert]).to eq('Something went wrong while creating your opinion.')
    end
  end
end
