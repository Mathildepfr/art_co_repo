class Collection < ApplicationRecord
  belongs_to :user
  has_many :artworks, dependent: :destroy

  include PgSearch::Model
  multisearchable against: :title
  PgSearch.multisearch_options = { using: { tsearch: { prefix: true } } }
end
