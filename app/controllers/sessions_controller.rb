class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email].try(:authenticate, params[:password]))
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:errors] = ["Oops you have entered an incorrect Email or Password"]
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end

end