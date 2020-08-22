class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to appointments_path
    else
      flash[:errors] = ("Sorry, an error occured. Try again.")
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :date_of_birth, :password, :password_confirmation)
  end

end