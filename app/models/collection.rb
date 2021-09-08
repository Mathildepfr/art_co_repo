class Collection < ApplicationRecord
  belongs_to :user
  has_many :artworks, dependent: :destroy
end
