class AppointmentsController < ApplicationController
  
  def show
    @appointments = Appointment.find_by(user_id: params[:id])
  end

end
