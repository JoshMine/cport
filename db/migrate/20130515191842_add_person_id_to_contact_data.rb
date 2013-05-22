class AddPersonIdToContactData < ActiveRecord::Migration
  def change
    remove_column :contact_data, :portfolio_id
    add_column :contact_data, :person_id, :integer
  end
end
