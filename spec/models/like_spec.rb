require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'creates a like with valid data' do
    like = Like.new(user: users(:user1), opinion: opinions(:opinion2))
    expect(like.save).to be true
  end

  it "doesn't creates a like for same user and opinion" do
    like = Like.new(user: users(:user1), opinion: opinions(:opinion1))
    expect(like.save).to be false
  end

  describe 'associations' do
    it 'should belong to user' do
      should belong_to(:user)
    end

    it 'should belong to opinion' do
      should belong_to(:opinion)
    end
  end
end
