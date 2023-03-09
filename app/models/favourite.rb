class Favourite < ApplicationRecord
  belongs_to :doctor_profile
  belongs_to :user
end
