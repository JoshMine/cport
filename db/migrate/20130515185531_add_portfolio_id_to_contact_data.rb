class AddPortfolioIdToContactData < ActiveRecord::Migration
  def change
    add_column :contact_data, :portfolio_id, :integer
  end
  
  def down
    remove_column :contact_data, :portfolio_id
  end
end
