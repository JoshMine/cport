class EditTablesContactDataAndPortfolio < ActiveRecord::Migration
  def change
    add_column :users, :portfolio_id, :integer
    add_column :people, :first_name, :string
    add_column :people, :middle_name, :string
    add_column :people, :last_name, :string
    remove_column :contact_data, :first_name
    remove_column :contact_data, :middle_name
    remove_column :contact_data, :last_name
    remove_column :portfolios, :user_id
  end

end
