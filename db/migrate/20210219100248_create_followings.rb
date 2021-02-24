class CreateFollowings < ActiveRecord::Migration[6.1]
  def change
    create_table :followings do |t|
      t.references :follow, null: false, foreign_key: {to_table: :users}
      t.references :follower, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
