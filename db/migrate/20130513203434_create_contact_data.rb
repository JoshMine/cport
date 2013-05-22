class CreateContactData < ActiveRecord::Migration
  def change
    create_table :contact_data do |t|
      
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :email
      t.string :m_phone
      t.string :h_phone
      t.string :f_address

      t.timestamps
    end
  end
end
