class LaboratoriesController < ApplicationController

  def show
    @lab = Laboratory.find_by(id: params[:id])
    @appts = @lab.appointments
  end

end
