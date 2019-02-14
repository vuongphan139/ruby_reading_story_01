class Chapter < ApplicationRecord
  belongs_to :story
  scope :newest, ->{order created_at: :desc}
  mount_uploader :image, PictureUploader
end
