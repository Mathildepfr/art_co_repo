class Venue < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :expos, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :type_of_venue, presence: true
  validates :venue_url, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  multisearchable against: %i[name address type_of_venue]
  PgSearch.multisearch_options = { using: { tsearch: { prefix: true } } }
end
