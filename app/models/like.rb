class Like < ApplicationRecord
  belongs_to :user
  belongs_to :opinion

  validates :opinion, uniqueness: { scope: :user }
end
