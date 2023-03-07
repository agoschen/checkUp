# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# For this seed we will be using:
# - faker to generate names and addresses
# - open-uri to download images from the internet
# - active storage to attach the images to the records

require "open-uri"

puts "Cleaning database..."

Appointment.destroy_all
DoctorProfile.destroy_all
User.destroy_all

puts "Creating users..."

# Create 10 users
10.times do

  # Create the user
  user = User.create!(
    Faker::TvShows::Simpsons.location,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    password_confirmation: Faker::Internet.password
  )

  # Create the doctor profile
  doctor_profile = DoctorProfile.create!(
    user: user,
    speciality: Faker::Job.field,
    practice_address: Faker::Address.full_address
  )

  # Create 5 appointments
  5.times do
    Appointment.create!(
      user: user,
      doctor_profile: doctor_profile,
      date: Faker::Date.between(from: 1.year.ago, to: 1.year.from_now),
      start_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
      end_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
      status: Faker::Boolean.boolean
    )
  end
end

puts "Finished!"
