class CreateQnas < ActiveRecord::Migration
  def change
    create_table :qnas do |t|
      t.integer :user_id
      t.string :content
      t.string :pic
      t.timestamps null: false
    end
  end
end
