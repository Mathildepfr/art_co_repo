class Artwork < ApplicationRecord
  belongs_to :collection

  acts_as_taggable_on :mediums, :styles

  has_one :user, through: :collection

  has_one_attached :photo

  validates :photo, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :size, presence: true

  include PgSearch::Model
  multisearchable against: %i[title description]
  PgSearch.multisearch_options = { using: { tsearch: { prefix: true } } }
end
