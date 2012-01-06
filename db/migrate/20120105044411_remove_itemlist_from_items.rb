class RemoveItemlistFromItems < ActiveRecord::Migration
  def self.up
    remove_column :items, :item_list
  end

  def self.down
    add_column :items, :item_list, :string
  end
end
