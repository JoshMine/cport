class RemoveRequireColumnFromLoan < ActiveRecord::Migration
  def up
    remove_column :loans, :required_payment
  end

  def down
    add_column :loans, :required_payment, :boolean
  end
end
