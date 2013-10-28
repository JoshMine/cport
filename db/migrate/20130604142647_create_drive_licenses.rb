class CreateDriveLicenses < ActiveRecord::Migration
  def change
    create_table :drive_licenses do |t|
      t.integer :participant_id
      t.string :series
      t.integer :number
      t.string :issuer
      t.date :issue_date
      t.date :exp_date
      t.integer :status, default: false
      t.attachment :doc_file

      t.timestamps
    end
  end
end
