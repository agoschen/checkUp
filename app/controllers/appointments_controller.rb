class AppointmentsController < ApplicationController
  # attr_reader :params
  def index
    p "This is the params :::#{params}"
    @params = params[:doctor_profile_id]
    @appointments = Appointment.where(doctor_profile_id: params[:doctor_profile_id])
    @user = @appointments.map { |user| User.find(user.user_id)}
  end

  def create
    puts "--" * 40
    puts "this is params #{params}"
    puts "--" * 40

    # params[:start_time]
    # params[:end_time]
    # params[:date]
    # params[:doctor_profile_id]
    puts "this is the DOCTOR!!! #{@params}"
  end


end
