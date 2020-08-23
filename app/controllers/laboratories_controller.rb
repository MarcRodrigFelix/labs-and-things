class LaboratoriesController < ApplicationController

  def show
    @lab = Laboratory.find(params[:id])
    @appointments = @lab.appointments.all
  end

end
