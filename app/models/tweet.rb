class Tweet < ApplicationRecord
  belongs_to :user, required: true

  validates :user_id, presence: true
  validates :message, presence: true, length: { maximum: 140 }
end
