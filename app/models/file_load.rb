require 'csv'
class FileLoad < ApplicationRecord
  validates :filename, presence: true
  validate :validate_file_exists, if: :filename
  serialize :results, Hash
  
  def full_path
    File.join(Rails.root,filename)
  end
  
  def validate_file_exists
    unless File.exist?(full_path)
      errors.add(:filename, "not found")
    end
  end
  
  before_create :load_file
  
  def load_file
    food_types = []
    CSV.foreach(full_path, headers: true) do |row|
      food_type = FoodShop.create(
        village:    row["Village"], 
        code:       row["Merchant Code"], 
        name:       row["Merchant Name"],
        food_type:  row["Food Type"]
      )
      food_types << food_type.serialized_data
    end
    self.results = {row_count: food_types.count, rows: food_types}
  end
      
  
end
