module LoginHelper

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    elsif ( user_id = cookies.signed[:user_id] )
      user = User.find_by_id(user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user ||= User.find_by_id(cookies.permanent.signed[:user_id])
      end
    end
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  
end
