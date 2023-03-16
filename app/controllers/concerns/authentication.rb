module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user

    helper_method :logged_in?, :logged_out?
  end

  def require_logged_in
    redirect_to(new_session_path) unless logged_in?
  end

  def require_logged_out
    redirect_to(root_path) unless logged_out?
  end

  def logged_in?
    Current.user
  end

  def logged_out?
    !logged_in?
  end

  private

  def set_current_user
    return unless authenticated_user

    Current.user = authenticated_user
  end

  def authenticated_user
    @authenticated_user ||= User.find_by(id: cookies.encrypted[:user_id])
  end

  def authenticate_user(user)
    cookies.encrypted[:user_id] = user.id
  end

  def clear_authenticated_user
    Current.user = nil
    cookies.delete(:user_id)
  end
end
