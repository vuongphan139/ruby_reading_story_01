class Chapter < ApplicationRecord
  belongs_to :story
  scope :newest, ->{order created_at: :desc}
  validates :name, presence: true
  validates :content, presence: true
  validates :story_id, presence: true
  validates :progress, presence: true

  mount_uploader :image, PictureUploader
  validates_presence_of :image
end
