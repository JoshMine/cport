class CreateIncomes < ActiveRecord::Migration
  def up
    create_table :incomes do |t|
      t.date :date_in
      t.string :income_type
      t.integer :amount
      t.integer :currency_id, nill: false
      t.integer :user_id, nill: false

      t.timestamps
    end
  end

  def down
    drop_table :incomes
  end
end
