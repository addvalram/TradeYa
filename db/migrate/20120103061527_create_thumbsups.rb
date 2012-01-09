class CreateThumbsups < ActiveRecord::Migration
  def self.up
    create_table :thumbsups do |t|
      t.integer :offer_id
      t.integer :user_id
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :thumbsups
  end
end
