class CreateFoodShops < ActiveRecord::Migration[5.0]
  def change
    create_table :food_shops do |t|
      t.string :village
      t.string :code
      t.string :name
      t.string :food_type

      t.timestamps
    end
  end
end
