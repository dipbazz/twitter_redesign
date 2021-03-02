class CreateOpinions < ActiveRecord::Migration[6.1]
  def change
    create_table :opinions do |t|
      t.references :user, null: true, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
