class Chapter < ApplicationRecord
  belongs_to :story
  mount_uploader :image, PictureUploader
end
