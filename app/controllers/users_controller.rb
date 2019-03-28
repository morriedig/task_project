class UsersController < ApplicationController
  before_action :check_login_before_login_and_signup, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      remember(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end
  
  def update
    @user = User.find_by_id(params[:id])
    @user.update(user_params)
    redirect_to user_path( @user )
  end
  
  def show
    @user = User.find_by_id(params[:id])
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
  
end
