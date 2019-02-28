class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :story
  scope :order_desc, ->{order created_at: :desc}
  scope :child_comments, ->(parent_id){where "parent_id = ?", parent_id}

  validates :user, presence: true
  validates :content, presence: true, length: {maximum: Settings.size_comment}
end
