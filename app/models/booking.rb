class Booking < ApplicationRecord
  belongs_to :animal, dependent: :destroy
  belongs_to :user
  
end
