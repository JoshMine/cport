class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :portfolio_id

      t.timestamps
    end
  end
end