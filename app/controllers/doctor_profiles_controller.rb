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

  def show
    @doc_info = DoctorProfile.find(params[:id])
    @doc_details = User.find(@doc_info.user_id)
  end

  private

  def doctor_params
    params.require(:doctor_profile).permit(:specialty, :practice_address, :availability, :user_id)
  end
end
