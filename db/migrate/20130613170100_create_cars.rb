class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :participant_id
      t.string :brand
      t.string :model
      t.integer :prod_year
      t.float :price
      t.attachment :photo

      t.timestamps
    end
  end
end
