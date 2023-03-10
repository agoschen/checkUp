class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.where(user_id: current_user)
    if current_user.doctor_profile.nil?
      @doctor_appointments = []
    else
      @doctor_appointments = Appointment.where(doctor_profile_id: current_user.doctor_profile.id)
    end
  end

  def create
    appointment = Appointment.new(appointment_params)
    appointment.user = current_user
    appointment.doctor_profile = DoctorProfile.find(params[:doctor_profile_id])
    if appointment.save
      redirect_to root_path
    end
  end

  def show
    @current_user = current_user
    @appointment = Appointment.find(params[:id])
    # if current_user.doctor_profile
    #   @appointment = Appointment.find(params[:id])
    # else
    #   @appointment = Appointment.find(params[:id])
    # end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :start_time, :end_time, :note, :doctor_profile_id, notes:)
  end
end
