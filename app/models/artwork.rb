class Artwork < ApplicationRecord
  belongs_to :collection
  belongs_to :user

  has_one_attached :photo
end
