class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.where(user_id: current_user)
  end

  # def show
  #   @appointment = Appointment.find(params[:id])
  # end

end
