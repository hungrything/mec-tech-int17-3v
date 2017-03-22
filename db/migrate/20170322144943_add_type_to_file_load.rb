class AddTypeToFileLoad < ActiveRecord::Migration[5.0]
  def change
    add_column :file_loads, :type, :string
  end
end
