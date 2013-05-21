class AddPortfolioIdToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :portfolio_id, :integer 
  end
end
