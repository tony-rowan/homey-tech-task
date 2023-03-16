class SessionAuthentication
  include ActiveModel::Model
  attr_accessor :username, :password

  validate :valid_credentials

  def user
    @user ||= User.find_by(username:)
  end

  private

  def valid_credentials
    return if user&.authenticate(password)

    errors.add(:base, "Incorrect username or password")
  end
end
