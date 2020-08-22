class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    byebug
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to appointment_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :date_of_birth, :password, :password_confirmation)
  end

end