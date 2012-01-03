class AddRejectofferToOffers < ActiveRecord::Migration
  def self.up
    add_column :offers, :reject_offer, :string
  end

  def self.down
    remove_column :offers, :reject_offer
  end
end
