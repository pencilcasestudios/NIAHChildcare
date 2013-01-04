class ApplicationController < ActionController::Base
  protect_from_forgery

  http_basic_authenticate_with name: AppConfig.http_basic_name, password: AppConfig.http_basic_password unless Rails.env == "test"

  helper_method :current_user, :user_signed_in?

  before_filter :set_user_time_zone

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    current_user.present?
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def set_user_time_zone
    Time.zone = current_user.time_zone if user_signed_in?
  end
end
