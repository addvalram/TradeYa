class RemoveOfferidFromComments < ActiveRecord::Migration
  def self.up
    remove_column :comments, :offer_id
  end

  def self.down
    add_column :comments, :offer_id, :integer
  end
end
