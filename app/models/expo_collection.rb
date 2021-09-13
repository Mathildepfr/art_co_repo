class ExpoCollection < ApplicationRecord
  belongs_to :expo
  belongs_to :collection

  enum status: [:pending, :accepted, :declined]
end
