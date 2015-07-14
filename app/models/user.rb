class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates_uniqueness_of :name
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email

  validates_presence_of :password, :on => :create
  has_secure_password 
end
