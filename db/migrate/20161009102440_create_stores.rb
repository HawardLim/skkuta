class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string   :s_pic
      t.string   :s_location
      t.string  :s_deliverytime
      t.string   :s_time
      t.string   :s_card
      t.string  :s_min
      t.integer  :s_deliver_ok
      t.integer  :s_card_ok
      t.integer  :s_divide_ok
      t.string   :s_name
      t.string   :s_intro
      t.string   :s_number
      t.string   :s_type
      t.string   :s_menu_pic
      t.string   :s_menu_pic2
      t.string   :s_menu_pic3
      t.string   :s_menu_pic4
      t.string   :s_menu_pic5
      t.string   :s_menu_pic6
      t.timestamps null: false
    end
  end
end
