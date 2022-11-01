class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.decimal :price
      t.string :type
      t.integer :model
      t.decimal :depreciation

      t.timestamps
    end
  end
end
