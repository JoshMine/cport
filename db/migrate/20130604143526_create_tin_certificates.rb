class CreateTinCertificates < ActiveRecord::Migration
  def change
    create_table :tin_certificates do |t|
      t.string :tin
      t.integer :status, default: false
      t.attachment :doc_file

      t.timestamps
    end
  end
end
