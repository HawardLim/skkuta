class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :store_id
      t.string :name
      t.text :content
      t.string :picture
      t.timestamps null: false
    end
  end
end
