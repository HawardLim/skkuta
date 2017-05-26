class AddColumnsToStoreTable < ActiveRecord::Migration
  def self.up
    add_column :stores, :view_count, :integer, :default => 0
    add_column :stores, :click_count, :integer, :default => 0
    add_column :stores, :s_site, :string, :default => :false
    add_column :stores, :s_theme, :string, :default => :false
  end

  def self.down
    remove_column :stores, :view_count
    remove_column :stores, :click_count
    remove_column :stores, :s_site
    remove_column :stores, :s_theme
  end

end
