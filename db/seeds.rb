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

  # Generate a random name
  name = Faker::Name.name

  # Generate a random email
  email = Faker::Internet.email

  # Generate a random password
  password = Faker::Internet.password

  # Create the user
  user = User.create!(
    name: name,
    email: email,
    password: password
  )

  # Generate a random address
  address = Faker::Address.full_address

  # Generate a random phone number
  phone_number = Faker::PhoneNumber.phone_number

  # Generate a random speciality
  speciality = Faker::Job.field

  # Generate a random bio
  bio = Faker::Lorem.paragraph

  # Generate a random price
  price = rand(50..500)

  # Generate a random photo
  photo = "https://source.unsplash.com/featured/?doctor"

  # Create the doctor profile
  doctor_profile = DoctorProfile.create!(
    user: user,
    address: address,
    phone_number: phone_number,
    speciality: speciality,
    bio: bio,
    price: price
  )

  # Download the photo from the internet
  file = URI.open(photo)

  # Attach the photo to the doctor profile
  doctor_profile.photo.attach(io: file, filename: "doctor-#{doctor_profile.id}.jpg", content_type: "image/jpg")

end

puts "Finished!"
