class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :appointments
  has_one :doctor_profile
  has_many :doctor_profiles, through: :appointments
  has_many :favourites
  has_many :doctor_profiles, through: :favourites
end
