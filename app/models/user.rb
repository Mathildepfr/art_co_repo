class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :venues, dependent: :destroy
  has_many :collections, dependent: :destroy
  has_many :artworks, through: :collections
  has_many :expos, through: :venues

  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_first_name_and_last_name,
                  against: %i[first_name last_name],
                  using: {
                    tsearch: { prefix: true }
                  }
end
