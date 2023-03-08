class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
<<<<<<< HEAD
    @doctors = DoctorProfile.all
    @users = @doctors.map { | doc |User.find(doc.user_id)}
=======
    @doctor_profiles = DoctorProfile.all
>>>>>>> master
  end
end
