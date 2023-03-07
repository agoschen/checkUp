class DoctorProfile < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_many :users, through: :appointments


  # needed to comment this below validations out in order to test the appointment creation in the console. No seeds. 
  # validates :specialty, presence: true
  # validates :practice_address, presence: true
  # validates :availability, presence: true
end
