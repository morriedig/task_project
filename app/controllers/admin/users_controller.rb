class Admin::UsersController < ApplicationController
  before_action :check_role

  def index
    @users = User.includes(:tasks).page(params[:page]).per(5)
  end

  def show
    @user = User.includes(:tasks).find_by_id(params[:id])
    @tasks = @user.tasks.page(params[:page]).per(5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_user_path(@user)
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
    redirect_to admin_user_path(@user)
  end

  def destroy
    user_id = params[:id].to_i
    if current_user.id == user_id
      flash[:danger] = "請由其他管理員刪除本帳號"
      redirect_to admin_root_path
    else
      begin
        HandleUser::Destroy.new(user_id)
      rescue
        flash[:danger] = "最後一位 admin 不可刪除"
        redirect_to admin_users_path
      end
    end

    

    # if current_user.id != user.id
    #   redirect_to admin_root_path 
    # else
    #   clear_session_and_cookies
    #   redirect_to login_path
    # end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :role)
  end

  def check_role
    if check_login || current_user.role != "admin"
      redirect_to root_path
    end
  end
end
