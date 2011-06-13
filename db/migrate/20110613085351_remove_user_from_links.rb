class RemoveUserFromLinks < ActiveRecord::Migration
  def self.up
    remove_index :links, :user_id
    remove_column :links, :user_id
  end

  def self.down
    add_column :links, :user_id, :integer
    add_index :links, :user_id
  end
end
