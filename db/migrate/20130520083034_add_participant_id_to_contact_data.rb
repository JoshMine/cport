class AddParticipantIdToContactData < ActiveRecord::Migration
  def change
    add_column :contact_data, :participant_id, :integer 
  end
end
