class Opinion < ApplicationRecord
  belongs_to :user

  validates :text, presence: true, length: { minimum: 5 }
end
