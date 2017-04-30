class CreateAdpics < ActiveRecord::Migration
  def change
    create_table :adpics do |t|
      t.string :title
      t.string :sub_title
      t.integer :store_id
      t.string :pic
      t.timestamps null: false
    end
  end
end
