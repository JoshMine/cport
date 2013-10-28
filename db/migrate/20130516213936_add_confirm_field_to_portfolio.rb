class AddConfirmFieldToPortfolio < ActiveRecord::Migration
  def change
    add_column :portfolios, :confirm, :boolean
  end
  
end
