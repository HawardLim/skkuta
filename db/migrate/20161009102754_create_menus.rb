class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      
      t.string  :m_name
      t.integer :m_price
      t.string  :m_category

      t.timestamps null: false
    end
  end
end
