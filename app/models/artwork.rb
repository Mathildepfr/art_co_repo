class Artwork < ApplicationRecord
  belongs_to :collection

  acts_as_taggable_on :mediums, :styles

  has_one :user, through: :collection

  has_one_attached :photo
end
