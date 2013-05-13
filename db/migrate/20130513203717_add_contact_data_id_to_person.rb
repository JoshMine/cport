class AddContactDataIdToPerson < ActiveRecord::Migration
  
  def change
    add_column :people, :contact_data_id, :integer
  end
  
end
