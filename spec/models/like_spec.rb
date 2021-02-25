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
end
