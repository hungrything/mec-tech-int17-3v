class FoodVendorFileLoad < FileLoad

  def create_food_shop row
    FoodShop.create(
      village:      row["Village"], 
      code:         row["Merchant Code"], 
      name:         row["Merchant Name"],
      service_type: row["Food Type"]
    )
  end
  
end
