class CreateLoans < ActiveRecord::Migration
  def up
    create_table :loans do |t|
      t.integer :user_id
      t.string :category
      t.string :loan_type
      t.integer :amount
      t.integer :term
      t.datetime :issue_date
      t.integer :monthly_payment
      t.decimal :rate
      t.integer :date_payment
      t.boolean :required_payment, default: false

      t.timestamps
    end

    add_index :loans, :user_id
    add_index :loans, :category
    add_index :loans, :required_payment
  end

  def down
    drop_table :loans
  end
end
