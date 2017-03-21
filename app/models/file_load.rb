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
    result_rows = []
    row_count = 0
    CSV.foreach(full_path, headers: true) do |row|
      row_count += 1
      result_rows << {
        village: row["Village"], 
        code: row["Merchant Code"], 
        name: row["Merchant Name"],
        food_type: row["Food Type"]
      }
    end
    self.results = {row_count: row_count, rows: result_rows}
  end
      
  
end
