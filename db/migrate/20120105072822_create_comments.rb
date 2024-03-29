class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :item_id
      t.integer :user_id
      t.string :comment
      t.integer :offer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
