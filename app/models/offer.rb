class Offer < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  has_many :thumbsups
  def self.findrecent()
    return Offer.find(:all,:order =>'updated_at DESC')
  end
end
