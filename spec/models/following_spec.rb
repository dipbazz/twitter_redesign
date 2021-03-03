require 'rails_helper'

RSpec.describe Following, type: :model do
  it 'checks for unique follower and following' do
    following = Following.new(followed: users(:user1), follower: users(:user2))
    expect(following.save).to be false
  end

  describe 'associations' do
    it 'should followed' do
      should belong_to(:followed)
    end

    it 'should follower' do
      should belong_to(:follower)
    end
  end
end
