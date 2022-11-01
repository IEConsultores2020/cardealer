class AddDealershipToCars < ActiveRecord::Migration[7.0]
  def change
    add_reference :cars, :dealership, null: false, foreign_key: true
  end
end
