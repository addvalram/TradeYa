class RenameMyUserIdToPublicUserIdUser < ActiveRecord::Migration
  def self.up
    rename_column(:offers, :my_user_id, :public_user_id)
    rename_column(:offers, :My_item_id, :my_item_id)
    
  end

  def self.down
  end
end
