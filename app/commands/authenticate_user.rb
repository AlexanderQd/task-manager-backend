class AuthenticateUser
  prepend SimpleCommand
  attr_accessor :email, :password

  def initialize email, password = nil
    @email = email
    @password = password
  end

  def call
    if user
      auth_user = user.as_json

      token = JsonWebToken.encode({ user_id: user.id }, 5.days.from_now)
      [auth_user, token]
    end
  end

  private

  def user
    user = User.find_by email: email
    return user if user && user.active && user.authenticate(password)
    errors.add(:user_not_found, 'user not found') if !user
    errors.add(:user_not_active, 'user not active for authentication') if user and !user.active?
    errors.add(:user_password_invalid, 'invalid password') if user and user.active and !user.authenticate(password)
    nil
  end
end