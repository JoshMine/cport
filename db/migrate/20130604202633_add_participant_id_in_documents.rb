class AddParticipantIdInDocuments < ActiveRecord::Migration
  def change
    add_column :pension_certificates, :participant_id, :integer
    add_column :tin_certificates, :participant_id, :integer
    add_column :oms_certificates, :participant_id, :integer
  end
end
