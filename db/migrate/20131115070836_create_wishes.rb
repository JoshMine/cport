class CreateWishes < ActiveRecord::Migration
  def up
    create_table :wishes do |t|
      t.integer :user_id
      t.integer :currency_id
      t.string :name
      t.integer :amount
      t.integer :need_amount
      t.date :final_date

      t.timestamps
    end
    add_index :wishes, [:user_id, :currency_id]

  end

  def down
    drop_table :wishes
  end
end
