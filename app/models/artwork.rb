class Artwork < ApplicationRecord
  belongs_to :collection
  belongs_to :user
  acts_as_taggable_on :mediums, :styles
end
