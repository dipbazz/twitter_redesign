class Opinion < ApplicationRecord
  belongs_to :user
  has_many :likes

  validates :text, presence: true, length: { minimum: 5 }
  default_scope { order(created_at: :desc) }
end
