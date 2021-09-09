class Expo < ApplicationRecord
  belongs_to :venue
  acts_as_taggable_on :mediums, :styles
  has_one :user, through: :venue

  MEDIUM = ["paintings", "installations", "sculptures", "photography"]
  STYLE = ["pop art", "realist", "cubist",
           "ukiyo", "abstract", "cubism",
           "futurism", "symbolism", "art nouveau",
           "surrealist", "folk", "contemporary", "postmodern"]
end
