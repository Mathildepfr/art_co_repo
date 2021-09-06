class ArtistInvitation < ApplicationRecord
  belongs_to :expo
  belongs_to :user

  enum status: [:pending, :accepted, :declined]
end
