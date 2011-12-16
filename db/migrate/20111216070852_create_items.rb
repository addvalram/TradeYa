class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.integer :user_id
      t.string :item_name
      t.text :item_description
      t.string :sale_status
      t.string :item_list
      t.boolean :item_choice

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
