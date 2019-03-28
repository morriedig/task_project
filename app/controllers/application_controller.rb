class ApplicationController < ActionController::Base
  rescue_from ActionView::Template::Error, :with => :view_error
  rescue_from NameError, :with => :name_error

  def view_error
    render file: "#{Rails.root}/public/500_view_error.html" , status: 500
  end

  def name_error
    render file: "#{Rails.root}/public/500_name_error.html" , status: 500
  end

  def render_404
    render file: "#{Rails.root}/public/404.html" , status: 404
  end

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

  def check_login_before_login_and_signup
    if login?
      redirect_to root_path
    end
  end
  

  def clear_session_and_cookies
    forget(@current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def forget(user)
    Logout::ForgetUser.new(user)
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def remember(user)
    Login::RememberUser.new(user)
    session[:user_id] = user.id
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent.signed[:remember_token] = user.remember_token
  end

  def check_role
    if login? && current_user.role != "admin"
      redirect_to root_path
    end
  end
end