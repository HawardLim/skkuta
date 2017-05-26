class AddThemeToStores < ActiveRecord::Migration
  def change
    add_column :stores, :s_tag, :text
  end
end
