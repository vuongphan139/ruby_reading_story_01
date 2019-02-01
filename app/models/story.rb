class Story < ApplicationRecord
  before_create :init_liked
  belongs_to :user
  has_and_belongs_to_many :categories
  mount_uploader :cover_image, PictureUploader

  def init_liked
    self.liked = 0
  end

  def category_info
    self.categories.map(&:name).join ", "
  end

  def progress_info
    (self.progress == Settings.progress_done)? I18n.t("done") : I18n.t("writing")
  end
end
