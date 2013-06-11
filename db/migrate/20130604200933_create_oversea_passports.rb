class CreateOverseaPassports < ActiveRecord::Migration
  def change
    create_table :oversea_passports do |t|
      t.integer :participant_id
      t.integer :series
      t.integer :number
      t.string :issuer
      t.date :issue_date
      t.date :exp_date
      t.string :last_name
      t.string :first_name
      t.integer :status
      t.attachment :doc_file

      t.timestamps
    end
  end
end
