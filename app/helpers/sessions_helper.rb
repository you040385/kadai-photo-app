module SessionsHelper
  def log_in(user)
    session[:user_session] = { 'id' => user.id }
  end

  def log_out
    session.delete(:user_session)
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session.dig(:user_session, 'id'))
  end

  def logged_in?
    current_user.present?
  end
end
