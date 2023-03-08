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
Appointment.destroy_all
Availability.destroy_all
Day.destroy_all
p "Creating users...."

p "Creating users...default user"

User.create!(
  first_name: "Jane Doe",
  last_name: "London",
  address: Faker::Address.full_address,
  email: 'janelondon@gmail.com',
  phone_number: Faker::PhoneNumber.cell_phone,
  password: '123456'
)

20.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone,
    password: '123456'
  )

  p "Creating users: name:#{user[:first_name]} phone number:#{user.email}"
end

puts "done creating users"
puts "-" * 20
puts "CREATING DOCTORS"
puts "-" * 20

5.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone,
    password: '123456'
  )

  puts "-" * 20
  puts "CREATING doctors: name:#{user[:first_name]} phone number:#{user[:phone_number]}"

  puts "This is Dr #{user.last_name}"

  doctor_profiles = DoctorProfile.create(
    specialty: Faker::Job.key_skill,
    practice_address: Faker::Address.full_address,
    availability: Faker::Date.between(from: 1.year.ago, to: 1.year.from_now),
    user_id: user.id
  )

  puts "Creating doctor profiles: email:#{doctor_profiles.user.email} user id::#{doctor_profiles[:user_id]}"
  puts "-" * 20
  puts "CREATING APPOINTMENTS"
  puts "-" * 20


  appointments = Appointment.create!(
    date: Faker::Date.between(from: 1.year.ago, to: 1.year.from_now),
    start_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    end_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    status: true,
    user_id: user.id,
    note: "",
    doctor_note: "",
    doctor_profile_id: doctor_profiles.id
  )
  puts "THIS IS THE APPOINTMENTS DATE::: #{appointments.date}"
  puts "-" * 20

  2.times do
    puts "-" * 20
    puts "CREATING DAYS"
    puts "-" * 20

    day = Day.create!(
      day: Faker::Date.between(from: 1.year.ago, to: 1.year.from_now),
      start_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
      end_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    )
    puts "THIS IS THE DAY::: #{day.day}"
    puts "-" * 20

    puts "-" * 20
    puts "CREATING AVAILABILITY"
    puts "-" * 20


    availability = Availability.create!(
      day_id: day.id,
      doctor_profile_id: doctor_profiles.id
    )
    puts "THIS IS THE AVAILABLE ID::: #{availability.day_id}"
    puts "-" * 20
  end
end

puts "Finished!"
