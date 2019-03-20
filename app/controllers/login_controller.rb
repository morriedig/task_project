class LoginController < ApplicationController
  before_action :check_login, only: [:destroy]

  def new
  end

  def create
    user = User.find_by_name(params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      cookies.permanent.signed[:user_id] = user.id
      redirect_to root_path
    else
      flash[:danger] = '輸入的名字錯誤或是密碼有誤' # Not quite right!
      render :new
    end
  end

  def destroy
    clear_session_and_cookies
    redirect_to login_path
  end

  private
  def clear_session_and_cookies
    session.delete(:user_id)
    @current_user = nil
    cookies.delete(:user_id)
  end
  
end