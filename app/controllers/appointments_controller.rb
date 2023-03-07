class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    @doctor_profile = DoctorProfile.find(params[:doctor_profile_id])
  end

  def index
    @user_appointments = Appointment.where(user_id: current_user.id)
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @doctor_profile = DoctorProfile.find(params[:doctor_profile_id])
    @appointment.doctor_profile = @doctor_profile
    @appointment.user = current_user
    if @appointment.save
      redirect_to doctor_profile_path(@doctor_profile), notice: "Appointment was successfully created."
    else
      render :new, status: :unprocessable_entity, notice: "Appointment was not successfully created."
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, :user_id, :doctor_profile_id)
  end
end
