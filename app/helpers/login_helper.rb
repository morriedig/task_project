module LoginHelper

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    elsif cookies.permanent.signed[:user_id]
      @current_user ||= User.find_by_id(cookies.permanent.signed[:user_id])
    end
  end
end
