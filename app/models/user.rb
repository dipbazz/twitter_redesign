class User < ApplicationRecord
  # include image uploader to upload image
  include ImageUploader::Attachment(:photo)
  include ImageUploader::Attachment(:cover_image)

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :opinions, dependent: :nullify
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Following'
  has_many :follows, through: :followed_users, source: :followed, dependent: :destroy

  has_many :following_users, foreign_key: :followed_id, class_name: 'Following'
  has_many :followers, through: :following_users, dependent: :destroy

  has_many :likes, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { minimum: 4 }

  default_scope { order(created_at: :desc) }

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:username))
      where(conditions.to_h).where(['lower(username) = :value', { value: login.downcase }]).first
    elsif conditions.key?(:username)
      where(conditions.to_h).first
    end
  end

  def follows?(user)
    follows.include?(user)
  end
end
