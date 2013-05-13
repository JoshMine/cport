class AddContactDataIdToPerson < ActiveRecord::Migration
  
  def change
    add_column :person, :contact_data_id, :integer
  end
  
end
