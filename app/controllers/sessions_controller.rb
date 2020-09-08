class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :create_with_google_oauth]

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
      flash[:errors] = ['Incorrect username or password']
      redirect_to login_path
    end
  end

  def create_with_google_oauth
  byebug
    omniauth = request.env['omniauth.auth']['info']
    user = User.find_or_create_by(email: omniauth["email"]) do |u|
        u.first_name = omniauth["first_name"]
        u.last_name = omniauth["last_name"]
        u.password = SecureRandom.hex
      end    
      session[:user_id] = user.id
      redirect_to user_path(user)
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

end