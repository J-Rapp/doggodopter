class Dog < ActiveRecord::Base
  has_many :matches
  
  validates_presence_of :url, :images
  validates_uniqueness_of :url
end
