require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Invalid username' do
    it 'checks for unique username' do
      # username user1 is already in our fixture file
      user = User.new(username: 'user1', email: 'test@mail.com', password: '123456')
      expect(user.save).to be false
    end

    it 'checks for username existence' do
      user = User.new(username: '', email: 'test@mail.com', password: '123456')
      expect(user.save).to be false
    end

    it 'checks for minumum length' do
      user = User.new(username: 'dip', email: 'test@mail.com', password: '123456')
      expect(user.save).to be false
    end
  end

  describe 'valid username' do
    it 'saves the user with valid data' do
      user = User.new(username: 'test', email: 'test@mail.com', password: '123456')
      expect(user.save).to be true
    end
  end

  describe 'associations' do
    it 'should have many opinions' do
      should have_many(:opinions)
    end

    it 'should have many followed users' do
      should have_many(:followed_users).with_foreign_key('follower_id')
    end

    it 'should have many follows' do
      should have_many(:follows).through(:followed_users).dependent(:destroy)
    end

    it 'should have many following users' do
      should have_many(:following_users).with_foreign_key('followed_id')
    end

    it 'should have many followers' do
      should have_many(:followers).through(:following_users).dependent(:destroy)
    end

    it 'should have many likes' do
      should have_many(:likes).dependent(:destroy)
    end
  end

  describe 'follows? method' do
    it 'to return true if the user follows another user' do
      expect(users(:user1).follows?(users(:user2))).to be true
    end

    it "to return false if the user hasn't yet followed another user" do
      expect(users(:user1).follows?(users(:user3))).to be false
    end
  end
end
