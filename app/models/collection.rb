class Collection < ApplicationRecord
  belongs_to :user
  has_many :artworks, dependent: :destroy
  has_many :expo_collections, dependent: :destroy

  validates :title, presence: true

  include PgSearch::Model
  multisearchable against: :title
  PgSearch.multisearch_options = { using: { tsearch: { prefix: true } } }
end
