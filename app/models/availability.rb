class Availability < ApplicationRecord
  belongs_to :doctor_profile
  belongs_to :day
end
