class AddPersonIdToUsers < ActiveRecord::Migration
  
   def change
    add_column :user, :person_id, :integer
  end
  
end
