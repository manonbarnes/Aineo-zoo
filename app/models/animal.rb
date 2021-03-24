class Animal < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :age, presence: true
  validates :sex, presence: true
  validates :category, presence: true
  #validates :personality_attributes, presence: true
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, through: :user
end
