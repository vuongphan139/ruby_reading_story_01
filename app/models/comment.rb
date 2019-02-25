class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :story
  scope :order_desc, ->{order created_at: :desc}
  validates :user, presence: true
  validates :content, presence: true, length: {maximum: Settings.size_comment}
end
