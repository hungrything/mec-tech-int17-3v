class ModifyFoodShopModelColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :food_shops, :food_type, :service_type
  end
end
