class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    return nil if session[:session_token].nil?
    @user ||= User.find_by_session_token(session[:session_token])
  end
end
