class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  before_action :find_laboratory

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    @user_appts = Appointment.where(user_id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :birthdate, :password, :password_confirmation)
  end

  def find_laboratory
    @laboratory = Laboratory.find_by(params[:laboratory_id])
  end

end