class DoctorProfile < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :appointments
  has_many :users, through: :appointments, dependent: :destroy

  validates :specialty, presence: true
  validates :practice_address, presence: true
end
