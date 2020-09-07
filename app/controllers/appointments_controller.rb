class AppointmentsController < ApplicationController
  before_action :find_laboratory
  skip_before_action :find_laboratory, only: [:show]
  
  def index
    if @laboratory
      @appointments = @laboratory.appointments.where(user_id: @user.id)
    else
      @appointments = Appointment.all.where(user_id: @user.id)
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
  end

  def create
    if @laboratory
      @appointment = @laboratory.appointments.create(appointments_params)
    else
      @appointment = Appointment.create(appointments_params)
    end
    if @appointment.valid?
      redirect_to laboratory_appointment_path(@laboratory, @appointment)
    else
      render :new
    end
  end

  def destroy
    Appointment.find(params[:id]).destroy
    redirect_to appointments_path
  end

  private

  def find_laboratory
    @laboratory = Laboratory.find(params[:laboratory_id])
  end

  def appointments_params
    params.require(:appointment).permit(:type_of_appt, :appt_time, :appt_date, :laboratory_id, :user_id).merge(user_id: current_user.id)
  end
end


# type_of_appt: params[:appointment][:type_of_appt], appt_time: params[:appointment][:appt_time], appt_date: params[:appointment][:appt_date]