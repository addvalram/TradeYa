class CreateOffers < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.integer :item_id
      t.integer :user_id
      t.boolean :offer_status

      t.timestamps
    end
  end

  def self.down
    drop_table :offers
  end
end
