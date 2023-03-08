class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
    @doctors = DoctorProfile.all
    @users = @doctors.map { | doc |User.find(doc.user_id)}
  end
end
