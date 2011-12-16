class User < ActiveRecord::Base
    validates_uniqueness_of :user_name ,:message => "username already exists."
  validates_uniqueness_of :email ,:message => "email already exists in the database."
  validates_presence_of :user_name, :email

  acts_as_authentic
end
