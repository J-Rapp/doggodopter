class User < ActiveRecord::Base
  has_many :matches

  validates :email, uniqueness: { message: 'Email already taken.' },
                    presence: { allow_blank: false, message: 'Enter an email.' }
  validates :password, length: { minimum: 6 }

  has_secure_password
end
