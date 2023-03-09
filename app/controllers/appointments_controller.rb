class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    @doctor_profile = DoctorProfile.find(params[:doctor_profile_id])
    @doctor_profile_user = User.find(@doctor_profile.user_id)
  end

  def create
    @appointment = Appointment.new(appointment_params)
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
    # there are 3 ways I can think of we can solve this.
    # 1. we make 2 def index_1_user, def index_2_dr
    # if we do that ^ we will need 2 index files and 2 show pages.
    #   if we can access the current user (variable)save as? - and 'render' different bits of code (variable) - in
    #     the show and indexs pages - then we dont need the additional files.
    #     the 2 ways I can imagine are listed below

    # appointments/:id = the index page params - url.http://localhost:3000/appointments = index ;  http://localhost:3000/appointments/78 = show

    # if current_user has a :doc_profile_id
    # OR
    # if appointment_params.includes?(:doc_profile_id)

    #   # render :show, dr part of code - to show the records for his appts - many many
    #   # the doctors appointments index - the second one
    #   # <%= render "appointments/form", appointment: @appointment %>

    # else
    #   # render :show, patient  part of code - to show the records for his appts - fewer
    # # if current_user doc_profile_id: ?
    # # if current_user != doc_profile_id
  # end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :start_time, :end_time, :user_id, :doctor_profile_id)
  end
end
