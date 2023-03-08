class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
    @doctors = DoctorProfile.all
    @users = @doctors.map { | doc |User.find(doc.user_id)}
    @doctor_profiles = DoctorProfile.all
    @markers = @doctor_profiles.geocoded.map do |doctor_profile|
      {
        lat: doctor_profile.latitude,
        lng: doctor_profile.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {doctor_profile: doctor_profile}),
        marker_html: render_to_string(partial: "marker", locals: {doctor_profile: doctor_profile})
      }
    end
  end
end
