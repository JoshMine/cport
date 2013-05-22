class AddUserIdToPortfolios < ActiveRecord::Migration
  def change
     add_column :portfolios, :user_id, :integer
     remove_column :users, :portfolio_id
  end
end
