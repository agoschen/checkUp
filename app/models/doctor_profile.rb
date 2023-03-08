class DoctorProfile < ApplicationRecord
  geocoded_by :practice_address
  after_validation :geocode, if: :will_save_change_to_practice_address?
  belongs_to :user, dependent: :destroy
  has_many :appointments
  has_many :users, through: :appointments, dependent: :destroy
  validates :specialty, presence: true
  validates :practice_address, presence: true

end
