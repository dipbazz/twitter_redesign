require 'rails_helper'

RSpec.describe Opinion, type: :model do
  describe 'Invalid text' do
    it 'checks for text presence' do
      opinion = Opinion.new(user: users(:one), text: '')
      expect(opinion.save).to be false
    end

    it 'checks for minimum length' do
      opinion = Opinion.new(user: users(:one), text: 'this')
      expect(opinion.save).to be false
    end
  end

  describe 'Valid text' do
    it 'saves opinion with valid data' do
      opinion = Opinion.new(user: users(:one), text: 'This is a test opinion.')
      expect(opinion.save).to be true
    end
  end
end