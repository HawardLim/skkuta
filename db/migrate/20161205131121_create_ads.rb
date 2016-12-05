class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :ad_title
      t.string :ad_content
      t.string :store_id
      t.string :ad_store
      t.timestamps null: false
    end
  end
end
