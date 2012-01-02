class User < ActiveRecord::Base
has_many :items,:dependent=>:destroy
has_many :offers ,:dependent=>:destroy
has_many :recent_activities
  validates_uniqueness_of :user_name ,:message => "username already exists."
  validates_uniqueness_of :email ,:message => "email already exists in the database."
  acts_as_authentic
has_attached_file :photo, :style => { :small => "150x150>" }  
end
