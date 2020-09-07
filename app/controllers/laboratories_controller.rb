class LaboratoriesController < ApplicationController
  before_action :set_laboratory, only: [:show]
  
  def index
    @laboratories = Laboratory.all
  end

  def show
    @appointments = @laboratory.appointments
  end

  def new
    @laboratory = Laboratory.new
  end

  def create
    @laboratory = Laboratory.create(lab_params)
    if @laboratory.valid?
      redirect_to laboratories_path
    else
      render :new
    end
  end

  private

  def set_laboratory
    @laboratory = Laboratory.find(params[:id])
  end

  def lab_params
    params.require(:laboratory).permit(:name, :lab_type, :phone_number, :address, :lab_hours, :days_of_operation, :appointment_id)
  end

end
