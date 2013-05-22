class AddRatingAndIndexFieldsToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :rating, :integer
    add_column :participants, :index, :integer
  end
end
