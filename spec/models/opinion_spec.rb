require 'rails_helper'

RSpec.describe Opinion, type: :model do
  describe 'Invalid text' do
    it 'checks for text presence' do
      opinion = Opinion.new(user: users(:user1), text: '')
      expect(opinion.save).to be false
    end

    it 'checks for minimum length' do
      opinion = Opinion.new(user: users(:user1), text: 'this')
      expect(opinion.save).to be false
    end
  end

  describe 'Valid text' do
    it 'saves opinion with valid data' do
      opinion = Opinion.new(user: users(:user1), text: 'This is a test opinion.')
      expect(opinion.save).to be true
    end
  end

  describe 'associations' do
    it 'should have many likes' do
      should have_many(:likes).dependent(:destroy)
    end

    it 'should belong to user' do
      should belong_to(:user)
    end
  end
end
