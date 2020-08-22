class ApplicationController < ActionController::Base

  def current_user
    !!session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authorized
    if !logged_in?
      redirect_to login_path
    end
  end

end
