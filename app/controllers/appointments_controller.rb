class AppointmentsController < ApplicationController
  before_action :set_laboratory
  # skip_before_action :find_laboratory, only: [:index, :show]
  
  def index
    if @laboratory
      @appointments = @laboratory.appointments.where(user_id: @user.id)
    else
      @appointments = @user.appointments.all
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
      @appointment = @laboratory.appointments.create(appointment_params)
    else
      @appointment = Appointment.create(appointment_params)
      @laboratory = @appointment.laboratory
    end
    if @appointment.valid?
      redirect_to laboratory_appointment_path(@laboratory, @appointment)
    else
      render :new
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_params)
    if @appointment.valid?
      redirect_to appointment_path(@appointment)
    else
      render :edit
    end
  end

  def destroy
    Appointment.find(params[:id]).destroy
    redirect_to appointments_path
  end

  private

  def set_laboratory
    @laboratory = Laboratory.find_by_id(params[:laboratory_id])
  end

  def appointment_params
    params.require(:appointment).permit(:type_of_appt, :appt_time, :appt_date, :laboratory_id, 
    laboratory_attributes: [ :name, :lab_type, :phone_number, :address, :lab_hours, :days_of_operation] ).merge(user_id: current_user.id)
  end
end
