class LoginForm
  include ActiveModel::Model

  attr_accessor :email, :password

  validates_presence_of :email, allow_blank: false, message: 'Enter your email'
  validates_presence_of :password, allow_blank: false, message: 'Enter your password'

  validate :authentic_user

  def authentic_user
    @user = User.find_by(email: @email)
    if @user.nil?
      @errors.add(:login, 'Unable to log in, please try again')
    elsif @user.authenticate(@password) == false
      @errors.add(:login, 'Unable to log in, please try again')
    end
  end

  def user_id
    @user.id || User.find_by(email: @email).id
  end
end
