class RemoveUnusedUserColumns < ActiveRecord::Migration
  def up
    remove_column :users, :password_digest
  end

  def down
    add_column :users, :password_digest
  end
end