class User < ActiveRecord::Base
  validates_presence_of :username, uniqueness: true, allow_blank: false, message: 'Enter a username.'
  validates :password, length: { minimum: 6 }

  has_secure_password
end
