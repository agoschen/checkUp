class DoctorProfile < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_many :users, through: :appointments
  validates :specialty, presence: true
  validates :practice_address, presence: true
  validates :availability, presence: true
end
