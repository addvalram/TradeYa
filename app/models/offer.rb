class Offer < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
<<<<<<< HEAD
  
=======
  has_many :thumbsups
>>>>>>> 4a05d63c85b9f97105a852b07f9b3e83bd51c156
  def self.findrecent()
    return Offer.find(:all,:order =>'updated_at DESC')
  end
end
