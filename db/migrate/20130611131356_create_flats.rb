class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.integer :participant_id
      t.string :address
      t.integer :rooms_quantity
      t.float :total_square
      t.float :living_square
      t.integer :floor
      t.float :price

      t.timestamps
    end
  end
end
