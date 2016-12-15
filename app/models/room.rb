class Room < ActiveRecord::Base
  # Field validators:
  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :address, presence: true
  validates :accommodate, presence: true
  validates :bed_room, presence: true
  validates :bath_room, presence: true
  validates :listing_name, presence: true, length: {maximum: 64}
  validates :summary, presence: true, length: {maximum: 600}
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  
  # One-to-many relationship:
  belongs_to :user
  has_many :photos
  has_many :reservations
end
