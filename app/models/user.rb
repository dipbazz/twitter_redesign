class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :opinions
  has_many :following
  has_many :followers, through: :following

  validates :username, presence: true, uniqueness: true, length: { minimum: 4 }
end
