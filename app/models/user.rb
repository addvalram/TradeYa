class User < ActiveRecord::Base
has_many :items
has_many :offers
has_many :recent_activities

    validates_uniqueness_of :user_name ,:message => "username already exists."
  validates_uniqueness_of :email ,:message => "email already exists in the database."
  validates_presence_of :user_name, :email

  acts_as_authentic
end
