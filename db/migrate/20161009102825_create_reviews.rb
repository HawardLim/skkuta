class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      
      t.string :r_pic
      t.string :store_id
      t.string :r_text
      t.integer :r_deliverytime
      t.string :r_nickname
      t.integer :r_gingko

      t.timestamps null: false
    end
  end
end
