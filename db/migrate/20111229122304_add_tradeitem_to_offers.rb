class AddTradeitemToOffers < ActiveRecord::Migration
  def self.up
    add_column :offers, :trade_item_id, :integer
  end

  def self.down
    remove_column :offers, :trade_item_id
  end
end
