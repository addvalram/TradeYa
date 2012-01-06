class RemoveSalestatusFromItems < ActiveRecord::Migration
  def self.up
    remove_column :items, :sale_status
  end

  def self.down
    add_column :items, :sale_status, :string
  end
end
