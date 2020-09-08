class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :create_with_google_oauth]

  def new
    if logged_in?
      redirect_to user_path(current_user)
    end
  end


  def create_with_google_oauth
    omniauth = request.env['omniauth.auth']
    @user = User.find_or_create_by!(email: omniauth['info']['email']) do |u|
        u.first_name = omniauth['info']['first_name']
        u.last_name = omniauth['info']['last_name']
        u.password = SecureRandom.hex(10)
        u.password_confirmation = u.password
      end
      session[:user_id] = @user.id
      redirect_to user_path(@user)
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:errors] = ['Incorrect username or password']
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

end