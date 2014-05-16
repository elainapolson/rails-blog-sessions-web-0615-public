class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags
  validates_presence_of :name, :content
end