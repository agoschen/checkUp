puts "Starting database"
puts "Cleaning databas.....e"
DoctorProfile.destroy_all
User.destroy_all
Appointment.destroy_all

p "Creating users...."

20.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone,
    password: Faker::Internet.password
  )

  p "Creating users: name:#{user[:first_name]} phone number:#{user[:phone_number]}"
end

puts "done creating users"
puts "-" * 20
puts "CREATING DOCTOS"
puts "-" * 20

5.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone,
    password: Faker::Internet.password
  )

  puts "-" * 20
  puts "CREATING USERS FOR doctors: name:#{user[:first_name]} phone number:#{user[:phone_number]}"

  puts "This is user id::: #{user.first_name}"

  doctor_profiles = DoctorProfile.create(
    specialty: Faker::Job.key_skill,
    practice_address: Faker::Address.full_address,
    availability: Faker::Date.between(from: 1.year.ago, to: 1.year.from_now),
    user_id: user[:id]
  )

  puts "Creating doctor profiles: specialty:#{doctor_profiles[:specialty]} user id::#{doctor_profiles[:user_id]}"
  puts "-" * 20
  puts "CREATING APOINTMENTS"
  puts "-" * 20


  apointments = Appointment.create!(
    date: Faker::Date.between(from: 1.year.ago, to: 1.year.from_now),
    start_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    end_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    status: true,
    user_id: user[:id],
    doctor_profile_id: doctor_profiles[:id]
  )
  puts "THIS IS THE APPOINTMENTS DATE::: #{apointments.date}"
  puts "-" * 20
end

