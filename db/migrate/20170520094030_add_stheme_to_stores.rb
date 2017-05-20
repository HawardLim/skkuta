class AddSthemeToStores < ActiveRecord::Migration
  def change
    add_column :stores, :theme, :string
  end
end
