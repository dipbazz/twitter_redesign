class AddUniqueIndexToFollowing < ActiveRecord::Migration[6.1]
  def change
    add_index :followings, [:followed_id, :follower_id], unique: true
  end
end
