class AddThemeToStores < ActiveRecord::Migration
  def change
    add_column :stores, :s_theme, :string
  end
end
