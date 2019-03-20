class ApplicationController < ActionController::Base

  def login?
    current_user.present?
  end

  private
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

  def check_login
    if !login?
      redirect_to login_path
    end
  end
end