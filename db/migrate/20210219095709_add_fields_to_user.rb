class AddFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :full_name, :string
    add_column :users, :photo_data, :string
    add_column :users, :cover_image_data, :string

    add_index :users, :username
  end
end
