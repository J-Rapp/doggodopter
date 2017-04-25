class User < ActiveRecord::Base
  validates :username, uniqueness: { message: 'Username already taken' },
                       presence: { allow_blank: false, message: 'Enter a username.' }
  validates :password, length: { minimum: 6 }

  has_secure_password
end
