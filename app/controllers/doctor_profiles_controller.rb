class DoctorProfilesController < ApplicationController
  def new
    @user = current_user
    @doctor_profile = DoctorProfile.new
  end

  def create
    @doctor_profile = DoctorProfile.new(doctor_params)
    @doctor_profile.user = current_user
    if @doctor_profile.save
      redirect_to root_path, notice: "Doctor profile was successfully created."
    else
      render :new, status: :unprocessable_entity, notice: "Doctor profile was not successfully created."
    end
  end

  def index
    if params[:query].present?
      @doctor_profiles = DoctorProfile.search_by_specialty(params[:query])
    else
      @doctor_profiles = DoctorProfile.all
    end
    @markers = @doctor_profiles.geocoded.map do |doctor_profile|
      {
        lat: doctor_profile.latitude,
        lng: doctor_profile.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {doctor_profile: doctor_profile}),
        marker_html: render_to_string(partial: "marker", locals: {doctor_profile: doctor_profile})
      }
    end
  end

  def show
    @doctor_profile = DoctorProfile.find(params[:id])
    @doctor_profile_user = User.find(@doctor_profile.user_id)
    @appointment = Appointment.new
    @appointments = Appointment.find(@doctor_profile.id)
  end

  private

  def doctor_params
    params.require(:doctor_profile).permit(:specialty, :practice_address, :availability, :photo, :user_id)
  end
end
