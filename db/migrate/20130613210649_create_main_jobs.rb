class CreateMainJobs < ActiveRecord::Migration
  def change
    create_table :main_jobs do |t|
      t.integer :participant_id
      t.string :company
      t.string :position
      t.date :start_date
      t.date :end_date
      t.string :description
      t.float :monthly_income

      t.timestamps
    end
  end
end
