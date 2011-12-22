class AddOfferrespondToOffers < ActiveRecord::Migration
  def self.up
    add_column :offers, :offer_respond, :string    
  end

  def self.down
    remove_column :offers, :offer_respond
  end
end
