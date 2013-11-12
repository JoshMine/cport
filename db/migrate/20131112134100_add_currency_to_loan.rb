class AddCurrencyToLoan < ActiveRecord::Migration
  def up
    add_column :loans, :currency_id, :integer, null: false
  end

  def down
    remove_column :loans, :currency_id
  end
end
