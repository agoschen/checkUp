class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
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
end
