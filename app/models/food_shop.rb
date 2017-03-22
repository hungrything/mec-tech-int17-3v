class FoodShop < ApplicationRecord
  validates :name, :code, presence: true

  def serialized_data
    {
      village:    village, 
      code:       code, 
      name:       name,
      food_type:  food_type
    }
  end
end
