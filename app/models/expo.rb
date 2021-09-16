class Expo < ApplicationRecord
  belongs_to :venue
  acts_as_taggable_on :mediums, :styles
  has_one :user, through: :venue
  has_many :expo_collections, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :description, presence: true

  MEDIUM = ["paintings", "installations", "sculptures", "photography"]
  STYLE = ["pop art", "realist", "cubist",
           "ukiyo", "abstract", "cubism",
           "futurism", "symbolism", "art nouveau",
           "surrealist", "folk", "contemporary", "postmodern"]
end
