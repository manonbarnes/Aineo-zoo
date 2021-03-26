class Animal < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :age, presence: true
  validates :sex, presence: true
  validates :category, presence: true
  # validates :photo, presence: true
  #validates :personality_attributes, presence: true
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, through: :user
  has_many :reviews, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_category,
    against: [:category],
    using: {
      tsearch: { prefix: true }
    }

end
