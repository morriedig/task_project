class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
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
    params.require(:user).permit(:name, :password)
  end
  
end