class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.boolean :active

      t.timestamps
    end
  end
end
