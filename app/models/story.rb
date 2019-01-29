class Story < ApplicationRecord
  before_create :init_liked
  belongs_to :user
  has_and_belongs_to_many :categories
  mount_uploader :cover_image, PictureUploader

  def init_liked
    self.liked = 0
  end
end
