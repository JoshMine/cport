class CreatePassports < ActiveRecord::Migration
  def change
    create_table :passports do |t|
      t.integer :participant_id
      t.integer :series
      t.integer :number
      t.string :issuer
      t.string :dep_code
      t.date :issue_date
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :gender
      t.date :birth_date
      t.string :birth_place
      t.string :marrital_status
      t.string :official_address
      t.attachment :doc_file

      t.timestamps
    end
  end
end
