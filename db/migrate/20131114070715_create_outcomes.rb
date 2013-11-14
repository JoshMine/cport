class CreateOutcomes < ActiveRecord::Migration
  def change
    create_table :outcomes do |t|
      t.integer :user_id, nill: false
      t.string :outcome_type
      t.integer :amount
      t.date :date_out
      t.string :currency_id, nill: false
      t.boolean :required, default: false

      t.timestamps
    end
  end
end
