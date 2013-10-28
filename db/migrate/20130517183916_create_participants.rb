class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :last_name
      t.string :first_name
      t.string :middle_name

      t.timestamps
    end
  end
end
