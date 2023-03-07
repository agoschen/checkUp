class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    @doctor_profile = DoctorProfile.find(params[:doctor_profile_id])
    @doctor_profile_user = User.find(@doctor_profile.user_id)
  end

  def create
    @appointment = Appointmnent.new(appointment_params)
    @doctor_profile = DoctorProfile.find(params[:doctor_profile_id])
    @appointment.doctor_profile_id = @doctor_profile.id
    @appointment.user_id = current_user.id
    if @appointment.save
      redirect_to root_path, notice: "Appointment was successfully created."
    else
      render :new, status: :unprocessable_entity, notice: "Appointment was not successfully created."
    end
  end

  def index
    @appointments = Appointment.where(user_id: current_user)
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :start_time, :end_time, :user_id, :doctor_profile_id)
  end
end
