class User < ApplicationRecord
  ROLE = ['Owner', 'Borrower']
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_one_attached :photo
  validates :role, inclusion: { in: ROLE, message: 'in list' }
  has_many :animals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
