class CreateOmsCertificates < ActiveRecord::Migration
  def change
    create_table :oms_certificates do |t|
      t.string :number
      t.integer :status, default: false

      t.timestamps
    end
  end
end
