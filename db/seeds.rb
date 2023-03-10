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

puts "-" * 20
puts "Cleaning database..."
puts "-" * 20

Appointment.destroy_all
DoctorProfile.destroy_all
User.destroy_all
specialty_array = ["Dentist", "Psychologist", "Psychiatrist", "GP", "Dermatologist", "OB/GYN", "Cardiologist", "Opthamologist", "Paediatrician", "Ear, Nose & Throat Specialist"]
address_array = ["Gardens, Cape Town", "Rondebosch, Cape Town", "Bergvliet, Cape Town", "Greenpoint, Cape Town", "Salt River, Cape Town", "Vredehoek, Cape Town", "Edgemead, Cape Town"]
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
puts "*" * 20
puts "CREATING DOCTORS, USERS, APPOINTMENTS"
puts "*" * 20

# user + doctor + appt x 5
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 1,2,3,A- note the system = userX, doc_userY, appointmentZ, combo&
user1 = User.create!(
  first_name: "Mike",
  last_name: "Wells",
  address: "Vredehoek, Cape Town",
  phone_number: 1234,
  email: "mike@test.com",
  password: '123456'
  )
puts "User1 = #{user1.first_name}, user id: #{user1.id}, user email: #{user1.email}"

doc_user2 = User.create!(
  first_name: "James",
  last_name: "Keller",
  address: "Salt River, Cape Town",
  email: "james@test.com",
  phone_number: 1234,
  password: '123456'
)

doc_user_profile2 = DoctorProfile.create(
  specialty: specialty_array.sample,
  practice_address: "Claremont, Cape Town",
  # availability: ["Mon 08-09", "Mon 09-10", "Mon 10-11", "Mon 12-13", "Mon 13-14", "Mon 14-15", "Tues 08-09", "Tues 09-10", "Tues 10-11"],
  user_id: doc_user2.id
  practice_hours: 
)
file = File.open(File.join(__dir__, 'seed_images/doc1.png'))
doc_user_profile2.photo.attach(io: file, filename: 'dr pp.png', content_type: 'image/png')
puts "Doc2 = Dr #{doc_user2.first_name} #{doc_user2.last_name} (#{doc_user_profile2.specialty}), user id: #{doc_user2.id}, dr id: #{doc_user_profile2.id}, email: #{doc_user2.email}"

appointment3 = Appointment.create!(
  date: "2023-04-25",
  start_time:  "08:00:00",
  end_time: "09:00:00",
  status: true,
  user_id: user1.id,
  doctor_profile_id: doc_user_profile2.id
)
puts "Appt3: Date #{appointment3.date}, Appointment id: #{appointment3.id}, Time: #{appointment3.start_time} #{appointment3.end_time}, Adress: #{doc_user_profile2.practice_address}"

puts "COMBO A"
puts "User: #{user1.first_name}, Dr #{doc_user2.last_name} (#{doc_user_profile2.specialty}), Appointment: Date: #{appointment3.date}, Time: #{appointment3.start_time}, Adress: #{doc_user_profile2.practice_address}"
puts "-" * 20
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 4,5,6,B
user4 = User.create!(
  first_name: "Sarah",
  last_name: "Frost",
  address: "Gardens, Cape Town",
  phone_number: 1234,
  email: "sarah@test.com",
  password: '123456'
  )
puts "User4 = #{user4.first_name}, user id: #{user4.id}, user email: #{user4.email}"

doc_user5 = User.create!(
  first_name: "Hankey",
  last_name: "Panki",
  address: "Sea Point, Cape Town",
  email: "hankey@test.com",
  phone_number: 1234,
  password: '123456'
)

doc_user_profile5 = DoctorProfile.create(
  specialty: specialty_array.sample,
  practice_address: "Constantia, Cape Town",
  # availability: ["Mon 08-09", "Mon 09-10", "Mon 10-11", "Mon 12-13", "Mon 13-14", "Mon 14-15", "Tues 08-09", "Tues 09-10", "Tues 10-11"],
  user_id: doc_user5.id
)
file = File.open(File.join(__dir__, 'seed_images/doc2.png'))
doc_user_profile5.photo.attach(io: file, filename: 'dr pp.png', content_type: 'image/png')
puts "Doc5 = Dr #{doc_user5.first_name} #{doc_user5.last_name} (#{doc_user_profile5.specialty}), user id: #{doc_user5.id}, dr id: #{doc_user_profile5.id}, email: #{doc_user5.email}"

appointment6 = Appointment.create!(
  date: "2023-04-25",
  start_time:  "10:00:00",
  end_time: "11:00:00",
  status: true,
  user_id: user1.id,
  doctor_profile_id: doc_user_profile5.id
)
puts "Appt6: Date #{appointment6.date}, Appointment id: #{appointment6.id}, Time: #{appointment6.start_time} #{appointment6.end_time}, Adress: #{doc_user_profile5.practice_address}"

puts "COMBO B"
puts "User: #{user4.first_name}, Dr #{doc_user5.last_name} (#{doc_user_profile5.specialty}), Appointment: Date: #{appointment6.date}, Time: #{appointment6.start_time}, Adress: #{doc_user_profile5.practice_address}"
puts "-" * 20

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 7,8,9,C
user7 = User.create!(
  first_name: "Greg",
  last_name: "Makkie",
  address: "Vredehoek, Cape Town",
  phone_number: 1234,
  email: "greg@test.com",
  password: '123456'
  )
puts "User7 = #{user7.first_name}, user id: #{user7.id}, user email: #{user7.email}"

doc_user8 = User.create!(
  first_name: "Kate",
  last_name: "Marx",
  address: "Greenpoint, Cape Town",
  email: "kate@test.com",
  phone_number: 1234,
  password: '123456'
)

doc_user_profile8 = DoctorProfile.create(
  specialty: specialty_array.sample,
  practice_address: "Edgemead, Cape Town",
  # availability: ["Mon 08-09", "Mon 09-10", "Mon 10-11", "Mon 12-13", "Mon 13-14", "Mon 14-15", "Tues 08-09", "Tues 09-10", "Tues 10-11"],
  user_id: doc_user8.id
)
file = File.open(File.join(__dir__, 'seed_images/doc3.png'))
doc_user_profile8.photo.attach(io: file, filename: 'dr pp.png', content_type: 'image/png')
puts "Doc8 = Dr #{doc_user8.first_name} #{doc_user8.last_name} (#{doc_user_profile8.specialty}), user id: #{doc_user8.id}, dr id: #{doc_user_profile8.id}, email: #{doc_user8.email}"

appointment9 = Appointment.create!(
  date: "2023-04-23",
  start_time:  "07:00:00",
  end_time: "09:00:00",
  status: true,
  user_id: user7.id,
  doctor_profile_id: doc_user_profile8.id
)
puts "Appt9: Date #{appointment9.date}, Appointment id: #{appointment9.id}, Time: #{appointment9.start_time} #{appointment9.end_time}, Adress: #{doc_user_profile8.practice_address}"

puts "COMBO C"
puts "User: #{user7.first_name}, Dr #{doc_user8.last_name} (#{doc_user_profile8.specialty}), Appointment: Date: #{appointment9.date}, Time: #{appointment9.start_time}, Adress: #{doc_user_profile8.practice_address}"
puts "-" * 20

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 10,11,12,D

user10 = User.create!(
  first_name: "Salma",
  last_name: "Periola",
  address: "Camps Bay, Cape Town",
  phone_number: 1234,
  email: "salma@test.com",
  password: '123456'
)
puts "User10 = #{user10.first_name}, user id: #{user10.id}, user email: #{user10.email}"

doc_user11 = User.create!(
  first_name: "Henry",
  last_name: "Harriet",
  address: "Hout Bay, Cape Town",
  email: "henry@test.com",
  phone_number: 1234,
  password: '123456'
)

doc_user_profile11 = DoctorProfile.create(
  specialty: specialty_array.sample,
  practice_address: "Hout Bay, Cape Town",
  # availability: ["Mon 08-09", "Mon 09-10", "Mon 10-11", "Mon 12-13", "Mon 13-14", "Mon 14-15", "Tues 08-09", "Tues 09-10", "Tues 10-11"],
  user_id: doc_user11.id
)
file = File.open(File.join(__dir__, 'seed_images/doc4.png'))
doc_user_profile11.photo.attach(io: file, filename: 'dr pp.png', content_type: 'image/png')
puts "Doc8 = Dr #{doc_user11.first_name} #{doc_user11.last_name} (#{doc_user_profile11.specialty}), user id: #{doc_user11.id}, dr id: #{doc_user_profile11.id}, email: #{doc_user11.email}"

appointment12 = Appointment.create!(
  date: "2023-04-24",
  start_time:  "11:00:00",
  end_time: "12:00:00",
  status: true,
  user_id: user10.id,
  doctor_profile_id: doc_user_profile11.id
)
puts "Appt12: Date #{appointment12.date}, Appointment id: #{appointment12.id}, Time: #{appointment12.start_time} #{appointment12.end_time}, Adress: #{doc_user_profile11.practice_address}"

puts "COMBO D"
puts "User: #{user10.first_name}, Dr #{doc_user11.last_name} (#{doc_user_profile11.specialty}), Appointment: Date: #{appointment12.date}, Time: #{appointment12.start_time}, Adress: #{doc_user_profile11.practice_address}"
puts "-" * 20
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 13,14,15,E
user13 = User.create!(
  first_name: "Neil",
  last_name: "Square",
  address: "Durbanville, Cape Town",
  phone_number: 1234,
  email: "neil@test.com",
  password: '123456'
)
puts "User13 = #{user13.first_name}, user id: #{user13.id}, user email: #{user13.email}"

doc_user14 = User.create!(
  first_name: "Ricky",
  last_name: "Bobby",
  address: "Rondebosch, Cape Town",
  email: "ricky@test.com",
  phone_number: 1234,
  password: '123456'
)

doc_user_profile14 = DoctorProfile.create(
  specialty: "Sillynessology",
  practice_address: "Camps Bay, Cape Town",
  # availability: "#{appointment15..date.start_time}, appt, date, start time, i think this has to be a seperate table - since then you can access
  user_id: doc_user14.id
)
file = File.open(File.join(__dir__, 'seed_images/doc5.png'))
doc_user_profile14.photo.attach(io: file, filename: 'dr pp.png', content_type: 'image/png')
puts "Doc14 = Dr #{doc_user14.first_name} #{doc_user14.last_name} (#{doc_user_profile14.specialty}), user id: #{doc_user14.id}, dr id: #{doc_user_profile14.id}, email: #{doc_user14.email}"

appointment15 = Appointment.create!(
  date: "2023-04-23",
  start_time:  "13:00:00",
  end_time: "15:00:00",
  status: true,
  user_id: user13.id,
  doctor_profile_id: doc_user_profile14.id
)
puts "Appt15: Date #{appointment15.date}, Appointment id: #{appointment15.id}, Time: #{appointment15.start_time} #{appointment15.end_time}, Adress: #{doc_user_profile14.practice_address}"

puts "COMBO E"
puts "User: #{user13.first_name}, Dr #{doc_user14.last_name} (#{doc_user_profile14.specialty}), Appointment: Date: #{appointment15.date}, Time: #{appointment15.start_time}, Adress: #{doc_user_profile14.practice_address}"
puts "-" * 20
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 16,17,18,F
user16 = User.create!(
  first_name: "Carina",
  last_name: "Coronel",
  address: "Gardens, Cape Town",
  phone_number: 1234,
  email: "carina@test.com",
  password: '123456'
)
puts "User16 = #{user16.first_name}, user id: #{user16.id}, user email: #{user16.email}"

doc_user17 = User.create!(
  first_name: "Shirley",
  last_name: "Mentz",
  address: "Hout Bay, Cape Town",
  email: "shirley@test.com",
  phone_number: 1234,
  password: '123456'
)

doc_user_profile17 = DoctorProfile.create(
  specialty: specialty_array.sample,
  practice_address: "Milnerton, Cape Town",
  # availability: "#{appointment15..date.start_time}, appt, date, start time, i think this has to be a seperate table - since then you can access
  user_id: doc_user17.id
)
file = File.open(File.join(__dir__, 'seed_images/doc6.png'))
doc_user_profile17.photo.attach(io: file, filename: 'dr pp.png', content_type: 'image/png')
puts "Doc17 = Dr #{doc_user17.first_name} #{doc_user17.last_name} (#{doc_user_profile17.specialty}), user id: #{doc_user17.id}, dr id: #{doc_user_profile17.id}, email: #{doc_user17.email}"

appointment18 = Appointment.create!(
  date: "2023-04-24",
  start_time:  "13:00:00",
  end_time: "15:00:00",
  status: true,
  user_id: user16.id,
  doctor_profile_id: doc_user_profile17.id
)
puts "Appt18: Date #{appointment18.date}, Appointment id: #{appointment18.id}, Time: #{appointment18.start_time} #{appointment18.end_time}, Adress: #{doc_user_profile17.practice_address}"

puts "COMBO F"
puts "User: #{user16.first_name}, Dr #{doc_user17.last_name} (#{doc_user_profile17.specialty}), Appointment: Date: #{appointment18.date}, Time: #{appointment18.start_time}, Adress: #{doc_user_profile17.practice_address}"
puts "-" * 20
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 4,17,19,G
appointment19 = Appointment.create!(
  date: "2023-04-25",
  start_time:  "08:00:00",
  end_time: "09:00:00",
  status: true,
  user_id: user4.id,
  doctor_profile_id: doc_user_profile17.id
)

puts "User4 = #{user4.first_name}, user id: #{user4.id}, user email: #{user4.email}"
puts "Doc17 = Dr #{doc_user17.first_name} #{doc_user17.last_name} (#{doc_user_profile17.specialty}), user id: #{doc_user17.id}, dr id: #{doc_user_profile17.id}, email: #{doc_user17.email}"

puts "Appt19: Date #{appointment19.date}, Appointment id: #{appointment19.id}, Time: #{appointment19.start_time} #{appointment19.end_time}, Adress: #{doc_user_profile17.practice_address}"

puts "COMBO G"
puts "User: #{user4.first_name}, Dr #{doc_user17.last_name} (#{doc_user_profile17.specialty}), Appointment: Date: #{appointment19.date}, Time: #{appointment19.start_time}, Adress: #{doc_user_profile17.practice_address}"
puts "-" * 20

# 7,17,20,H
appointment20 = Appointment.create!(
  date: "2023-04-22",
  start_time:  "10:00:00",
  end_time: "12:00:00",
  status: true,
  user_id: user7.id,
  doctor_profile_id: doc_user_profile17.id
)

puts "User7 = #{user7.first_name}, user id: #{user7.id}, user email: #{user7.email}"
puts "Doc17 = Dr #{doc_user17.first_name} #{doc_user17.last_name} (#{doc_user_profile17.specialty}), user id: #{doc_user17.id}, dr id: #{doc_user_profile17.id}, email: #{doc_user17.email}"

puts "Appt20: Date #{appointment20.date}, Appointment id: #{appointment20.id}, Time: #{appointment20.start_time} #{appointment20.end_time}, Adress: #{doc_user_profile17.practice_address}"

puts "COMBO H"
puts "User: #{user7.first_name}, Dr #{doc_user17.last_name} (#{doc_user_profile17.specialty}), Appointment: Date: #{appointment20.date}, Time: #{appointment20.start_time}, Adress: #{doc_user_profile17.practice_address}"
puts "-" * 20

# 10,17,21,I
appointment21 = Appointment.create!(
  date: "2023-04-23",
  start_time:  "12:00:00",
  end_time: "14:00:00",
  status: true,
  user_id: user10.id,
  doctor_profile_id: doc_user_profile17.id
)

puts "User10 = #{user10.first_name}, user id: #{user10.id}, user email: #{user10.email}"
puts "Doc17 = Dr #{doc_user17.first_name} #{doc_user17.last_name} (#{doc_user_profile17.specialty}), user id: #{doc_user17.id}, dr id: #{doc_user_profile17.id}, email: #{doc_user17.email}"

puts "Appt21: Date #{appointment21.date}, Appointment id: #{appointment21.id}, Time: #{appointment21.start_time} #{appointment21.end_time}, Adress: #{doc_user_profile17.practice_address}"

puts "COMBO I"
puts "User: #{user10.first_name}, Dr #{doc_user17.last_name} (#{doc_user_profile17.specialty}), Appointment: Date: #{appointment21.date}, Time: #{appointment21.start_time}, Adress: #{doc_user_profile17.practice_address}"
puts "-" * 20

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 1,14,22,J
appointment22 = Appointment.create!(
  date: "2023-04-21",
  start_time:  "09:00:00",
  end_time: "11:00:00",
  status: true,
  user_id: user1.id,
  doctor_profile_id: doc_user_profile14.id
)

puts "User1 = #{user1.first_name}, user id: #{user1.id}, user email: #{user1.email}"
puts "Doc14 = Dr #{doc_user14.first_name} #{doc_user14.last_name} (#{doc_user_profile14.specialty}), user id: #{doc_user14.id}, dr id: #{doc_user_profile14.id}, email: #{doc_user14.email}"

puts "Appt22: Date #{appointment22.date}, Appointment id: #{appointment22.id}, Time: #{appointment22.start_time} #{appointment22.end_time}, Adress: #{doc_user_profile14.practice_address}"

puts "COMBO J"
puts "User: #{user1.first_name}, Dr #{doc_user14.last_name} (#{doc_user_profile14.specialty}), Appointment: Date: #{appointment22.date}, Time: #{appointment22.start_time}, Adress: #{doc_user_profile14.practice_address}"
puts "-" * 20
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 4,14,23,K
appointment23 = Appointment.create!(
  date: "2023-04-22",
  start_time:  "12:00:00",
  end_time: "14:00:00",
  status: true,
  user_id: user4.id,
  doctor_profile_id: doc_user_profile14.id
)

puts "User4 = #{user4.first_name}, user id: #{user4.id}, user email: #{user4.email}"
puts "Doc14 = Dr #{doc_user14.first_name} #{doc_user14.last_name} (#{doc_user_profile14.specialty}), user id: #{doc_user14.id}, dr id: #{doc_user_profile14.id}, email: #{doc_user14.email}"

puts "Appt23: Date #{appointment21.date}, Appointment id: #{appointment21.id}, Time: #{appointment21.start_time} #{appointment21.end_time}, Adress: #{doc_user_profile14.practice_address}"

puts "COMBO K"
puts "User: #{user4.first_name}, Dr #{doc_user14.last_name} (#{doc_user_profile14.specialty}), Appointment: Date: #{appointment21.date}, Time: #{appointment21.start_time}, Adress: #{doc_user_profile14.practice_address}"
puts "-" * 20
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 7,14,24,L
appointment24 = Appointment.create!(
  date: "2023-04-25",
  start_time:  "11:00:00",
  end_time: "12:00:00",
  status: true,
  user_id: user7.id,
  doctor_profile_id: doc_user_profile14.id
)

puts "User7 = #{user7.first_name}, user id: #{user7.id}, user email: #{user7.email}"
puts "Doc14 = Dr #{doc_user14.first_name} #{doc_user14.last_name} (#{doc_user_profile14.specialty}), user id: #{doc_user14.id}, dr id: #{doc_user_profile14.id}, email: #{doc_user14.email}"

puts "Appt24: Date #{appointment24.date}, Appointment id: #{appointment24.id}, Time: #{appointment24.start_time} #{appointment24.end_time}, Adress: #{doc_user_profile14.practice_address}"

puts "COMBO L"
puts "User: #{user7.first_name}, Dr #{doc_user14.last_name} (#{doc_user_profile14.specialty}), Appointment: Date: #{appointment24.date}, Time: #{appointment24.start_time}, Adress: #{doc_user_profile14.practice_address}"
puts "-" * 20
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 14,17,25,M
appointment25 = Appointment.create!(
  date: "2023-04-25",
  start_time:  "11:00:00",
  end_time: "12:00:00",
  status: true,
  user_id: doc_user14.id,
  doctor_profile_id: doc_user_profile17.id
)

puts "UserDoc14 = #{doc_user14.first_name}, user id: #{doc_user14.id}, user email: #{doc_user14.email}"
puts "Doc17 = Dr #{doc_user17.first_name} #{doc_user17.last_name} (#{doc_user_profile17.specialty}), user id: #{doc_user17.id}, dr id: #{doc_user_profile17.id}, email: #{doc_user17.email}"

puts "Appt25: Date #{appointment25.date}, Appointment id: #{appointment25.id}, Time: #{appointment25.start_time} #{appointment25.end_time}, Adress: #{doc_user_profile17.practice_address}"

puts "COMBO K"
puts "User: #{doc_user14.first_name}, Dr #{doc_user17.last_name} (#{doc_user_profile17.specialty}), Appointment: Date: #{appointment25.date}, Time: #{appointment25.start_time}, Adress: #{doc_user_profile14.practice_address}"
puts "-" * 20
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#########################################################################################################################
# puts "-" * 20
# puts "And CREATING PROFILES..."
# puts "-" * 20

# 15.times do
#   user = User.create!(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     address: address_array.sample,
#     phone_number: Faker::PhoneNumber.phone_number,
#     email: Faker::Internet.email,
#     password: '123456'
#     )
#   p "User name: #{user[:first_name]}, user id: #{user.id}, email: #{user.email}."
#   end


# 15.times do
#   user = User.create!(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     address: address_array.sample,
#     phone_number: Faker::PhoneNumber.phone_number,
#     email: Faker::Internet.email,
#     password: '123456'
#     )
#   doctor_profile = DoctorProfile.create!(
#     specialty: specialty_array.sample,
#     practice_address: address_array.sample,
#     availability: Faker::Date.between(from: 1.year.ago, to: 1.year.from_now),
#     user_id: user.id
#   )
#   p "Doc name: Dr #{user.last_name}, (#{doctor_profile.specialty}), user id: #{user.id}, dr_profile id: #{doctor_profile.id}, email: #{user.email}."
# end

# puts "-" * 20
# puts "done creating Profiles"
# puts "-" * 20

#########################################################################################################################
puts "So long and thanks for all the Feeeeesh!"
