class CreatePensionCertificates < ActiveRecord::Migration
  def change
    create_table :pension_certificates do |t|
      t.string :snils
      t.integer :status, default: false
      t.attachment :doc_file

      t.timestamps
    end
  end
end
