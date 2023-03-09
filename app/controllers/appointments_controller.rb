class AppointmentsController < ApplicationController
  before_action :set_params, only: %i[ show ]

  def index
    @appointments = Appointment.where(user_id: current_user)
    @doctor_appointments = Appointment.where(doctor_profile_id: current_user.doctor_profile.id)
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
  end

  private

  def set_params
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :start_time, :end_time, :note, :doctor_profile_id)
  end
end
