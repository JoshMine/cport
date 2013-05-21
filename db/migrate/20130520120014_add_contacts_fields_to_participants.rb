class AddContactsFieldsToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :gender, :string
    add_column :participants, :date_birth, :date
    add_column :participants, :m_phone, :string
    add_column :participants, :h_phone, :string
    add_column :participants, :f_address, :string
  end
end
