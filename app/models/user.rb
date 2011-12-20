class User < ActiveRecord::Base
has_many :items , :dependent => :destroy
has_many :offers ,:dependent => :destroy
has_many :recent_activities ,:dependent => :destroy

    validates_uniqueness_of :user_name ,:message => "username already exists."
  validates_uniqueness_of :email ,:message => "email already exists in the database."
  validates_presence_of :user_name, :email

  acts_as_authentic
  
  has_attached_file :photo,:styles => { :small => "150x150>" }
                 

end
