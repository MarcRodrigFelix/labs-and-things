class ApplicationController < ActionController::Base

  def current_user
    !!session[:user_id]
  end

end
