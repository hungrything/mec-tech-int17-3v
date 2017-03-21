class CreateFileLoads < ActiveRecord::Migration[5.0]
  def change
    create_table :file_loads do |t|
      t.string :filename
      t.text :results

      t.timestamps
    end
  end
end
