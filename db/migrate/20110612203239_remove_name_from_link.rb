class RemoveNameFromLink < ActiveRecord::Migration
  def self.up
    remove_column :links, :name
  end

  def self.down
    add_column :links, :name, :string
  end
end
