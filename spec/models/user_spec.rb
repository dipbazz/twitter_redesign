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
end
