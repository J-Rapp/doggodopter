class User < ActiveRecord::Base
  validates :Email, uniqueness: { message: 'Email already taken.' },
                    presence: { allow_blank: false, message: 'Enter an email.' }
  validates :password, length: { minimum: 6 }

  has_secure_password
end
