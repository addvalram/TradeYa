class RemoveItemchoiceFromItems < ActiveRecord::Migration
  def self.up
    remove_column :items, :item_choice
  end

  def self.down
    add_column :items, :item_choice, :string
  end
end
