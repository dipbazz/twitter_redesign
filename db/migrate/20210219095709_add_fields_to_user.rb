class AddFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :full_name, :string
    add_column :users, :photo, :string
    add_column :users, :cover_image, :string

    add_index :users, :username
  end
end
