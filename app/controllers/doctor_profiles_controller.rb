class DoctorProfilesController < ApplicationController
  def new
    @user = current_user
    @doctor_profile = DoctorProfile.new
  end

  def create
    @user = current_user
    @doctor_profile = DoctorProfile.new(doctor_params)
    if @doctor_profile.save
      redirect_to doctors_path(@doctor_profile), notice: "Doctor profile was successfully created."
    else
      render :new, status: :unprocessable_entity, notice: "Doctor profile was not successfully created."
    end
  end

  private

  def doctor_params
    params.require(:doctor_profile).permit(:specialty, :practice_address, :availability, :user_id)
  end
end
