class AddUserToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :user_id, :integer
    add_index :categories, :user_id
  end

  def self.down
    remove_index :categories, :user_id
    remove_column :categories, :user_id
  end
end
