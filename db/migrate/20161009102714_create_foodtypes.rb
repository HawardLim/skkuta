class CreateFoodtypes < ActiveRecord::Migration
  def change
    create_table :foodtypes do |t|
      t.string :chicken
      t.string :chinese
      t.string :korean
      t.string :japanese
      t.string :pizzaburger
      t.string :taco
      t.string :night
      t.timestamps null: false
    end
  end
end
