class Item < ActiveRecord::Base
  belongs_to :user
  has_many :offers
  #has_attached_file :photo, :style =>{:small=>"80x80>" ,:original => '250x250>'}
  has_attached_file :photo, :style => { :small => "150x150>" }  
  
  validates_attachment_presence :photo
#validates_attachment_size :photo, :less_than => 5.megabytes
#validates_attachment_content_type :photo, :content_type => ['image/gif','image/jpeg', 'image/png']
  def self.findpostItem(current_user)
    return Item.find_by_sql(["select * from items where user_id <> ? ORDER BY  updated_at DESC", current_user])
  end    
end
