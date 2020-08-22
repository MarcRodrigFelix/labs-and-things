class AppointmentsController < ApplicationController
  
  def index
    @appointments = @current_user.appointments
  end

  def new
    @appointment = Appointment.new
  end

  def create
  end
  
  def show
    @appointments = Appointment.find_by(user_id: params[:id])
  end

  private

  def set_laboratory
    @laboratory = Laboratory.find_by(params[:laboratory_id])
  end

  def appointments_params
    params.permit(:appointment).require(:type_of_appt, :appt_time, :appt_date)
  end
end
