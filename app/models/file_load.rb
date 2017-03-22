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
    food_shops = []
    CSV.foreach(full_path, headers: true) do |row|
      food_shop = create_food_shop row
      food_shops << food_shop.serialized_data
    end
    self.results = {row_count: food_shops.count, rows: food_shops}
  end   
  
end
