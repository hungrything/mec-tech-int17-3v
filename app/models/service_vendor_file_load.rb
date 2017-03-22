class ServiceVendorFileLoad < FileLoad

  def create_food_shop row
    FoodShop.create(
      village:      row["Village"], 
      code:         "#{row["Merchant Group"]}-#{row["Member ID"]}",
      name:         row["Merchant Name"],
      service_type: "#{row["Service Category"]} #{row["Services Detail"]}"
    )
  end
  
end
