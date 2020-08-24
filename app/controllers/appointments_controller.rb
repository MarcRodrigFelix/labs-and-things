class AppointmentsController < ApplicationController
  before_action :find_laboratory
  
  def index
    @appointments = @user.appointments
  end

  def new
    @appointment = Appointment.new
  end

  def create
      @appointment = Appointment.create(appointments_params)    
    if @appointment.valid?
      redirect_to user_appointment_path(@appointment.user, @appointment)
    else
      render :new
    end
  end
  
  def show
    @appointment = Appointment.find(params[:id])
  end

  def destroy
    Appointment.find(params[:id]).destroy
    redirect_to user_appointments_path(@user)
  end

  private

  def find_laboratory
    @laboratory = Laboratory.find_by(params[:laboratory_id])
  end

  def appointments_params
    params.require(:appointment).permit(:type_of_appt, :appt_time, :appt_date, :laboratory_id, laboratory_attributes:[:name, :lab_type, :phone_number, :address, :lab_hours, :days_of_operation] ).merge(user_id: current_user.id)
  end
end


# type_of_appt: params[:appointment][:type_of_appt], appt_time: params[:appointment][:appt_time], appt_date: params[:appointment][:appt_date]