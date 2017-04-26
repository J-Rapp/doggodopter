class Dog < ActiveRecord::Base
  validates_presence_of :url, :images
  validates_uniqueness_of :url
end
