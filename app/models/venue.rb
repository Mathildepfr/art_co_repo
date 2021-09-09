class Venue < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :expos, dependent: :destroy
end
