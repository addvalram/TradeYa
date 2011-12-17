class AddMyitemToOffers < ActiveRecord::Migration
  def self.up
    add_column :offers, :My_item_id, :integer
    add_column :offers, :my_user_id, :integer
  end

  def self.down
    remove_column :offers, :my_user_id
    remove_column :offers, :My_item_id
  end
end
