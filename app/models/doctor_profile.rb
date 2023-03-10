class DoctorProfile < ApplicationRecord
  geocoded_by :practice_address
  after_validation :geocode, if: :will_save_change_to_practice_address?
  belongs_to :user, dependent: :destroy
  has_many :appointments
  has_many :users, through: :appointments, dependent: :destroy
  validates :specialty, presence: true
  validates :practice_address, presence: true
  has_one_attached :photo
  has_many :favourites
  has_many :users, through: :favourites

  include PgSearch::Model
  pg_search_scope :search_by_specialty,
    against: [ :specialty ],
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :search_by_practice_address,
    against: [ :practice_address ],
    using: {
      tsearch: { prefix: true }
    }

end
