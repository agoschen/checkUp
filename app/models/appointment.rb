class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor_profile # and shouldnt this be somehow accessible via doctor_profile.user_id
  # can we possibly add an association here for "avaialbility" - through doctor_profile?
end
