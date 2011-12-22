class Offer < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  def self.findrecent()
    return Offer.find(:all,:order =>'updated_at DESC')
  end
end
