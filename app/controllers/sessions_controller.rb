class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    if logged_in?
      redirect_to user_path(current_user)
    end
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

end