class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.bool :active

      t.timestamps
    end
  end
end
