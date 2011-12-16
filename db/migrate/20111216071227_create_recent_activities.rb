class CreateRecentActivities < ActiveRecord::Migration
  def self.up
    create_table :recent_activities do |t|
      t.integer :user_id
      t.integer :item_id
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :recent_activities
  end
end
