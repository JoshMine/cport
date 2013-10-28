class RemovePersonIdFields < ActiveRecord::Migration
  def change
    remove_column :users, :person_id
    remove_column :contact_data, :person_id
  end
end
