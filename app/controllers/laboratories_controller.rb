class LaboratoriesController < ApplicationController

  def show
    @lab = Laboratory.find(params[:id])
    @appointments = @lab.appointments.all
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

  def lab_params
    params.require(:laboratory).permit(:name, :lab_type, :phone_number, :address, :lab_hours, :days_of_operation)
  end

end
