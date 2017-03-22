class FoodShop < ApplicationRecord
  validates :name, :code, presence: true

  def serialized_data
    {
      village:      village, 
      code:         code, 
      name:         name,
      service_type: service_type
    }
  end
  
end
