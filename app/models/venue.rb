class Venue < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :expos, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
