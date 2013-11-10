class CreateFIncomes < ActiveRecord::Migration
  def change
    create_table :f_incomes do |t|
      t.integer :year
      t.integer :month
      t.float :main_job
      t.float :secondary_job
      t.float :bussiness
      t.float :estate_rental
      t.float :other_incomes
      t.float :food
      t.float :goods
      t.float :car
      t.float :estate_rental_payment
      t.float :education
      t.float :other_outcomes

      t.timestamps
    end
  end
end
