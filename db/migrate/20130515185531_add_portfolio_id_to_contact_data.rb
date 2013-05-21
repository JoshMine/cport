class AddPortfolioIdToContactData < ActiveRecord::Migration
  def change
    add_column :contact_data, :portfolio_id, :integer
    remove_column :people, :contact_data_id
  end
  
  def down
    remove_column :contact_data, :portfolio_id
  end
end
