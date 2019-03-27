class LoginController < ApplicationController
  before_action :check_login, only: [:destroy]

  def new
  end

  def create
    user = User.find_by_name(params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      remember(user)
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

  
end