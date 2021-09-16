class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :venues, dependent: :destroy
  has_many :collections, dependent: :destroy
  has_many :artworks, through: :collections, dependent: :destroy
  has_many :expos, through: :venues, dependent: :destroy
  has_many :expo_collections, through: :collections, dependent: :destroy

  has_one_attached :photo

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true

  include PgSearch::Model
  multisearchable against: %i[first_name last_name]
  PgSearch.multisearch_options = { using: { tsearch: { prefix: true } } }
end
