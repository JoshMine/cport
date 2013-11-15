class AddIndexes < ActiveRecord::Migration
  def up
    add_index :loans, :currency_id
    add_index :incomes, :currency_id
    add_index :incomes, :user_id
    add_index :outcomes, :currency_id
    add_index :outcomes, :user_id
  end

  def down
    remove_index :loans, :currency_id
    remove_index :incomes, :currency_id
    remove_index :incomes, :user_id
    remove_index :outcomes, :currency_id
    remove_index :outcomes, :user_id
  end
end
