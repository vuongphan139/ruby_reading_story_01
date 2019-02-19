class Story < ApplicationRecord
  belongs_to :user
  has_many :chapters, dependent: :destroy
  has_many :comments
  has_many :interactives
  has_and_belongs_to_many :categories
  scope :search, ->(name) {where "name LIKE ?", "%#{name}%"}
  scope :newest, ->{order created_at: :desc}
  mount_uploader :cover_image, PictureUploader

  def current_user_liked user
    interactives.find_by user_id: user.id,
                         interactive_type: :like
  end

  def count_like
    interactives.like.size
  end

  def chapter_newest
    chapters.newest.first
  end

  def category_info
    categories.map(&:name).join ", "
  end

  def progress_info
    progress == Settings.progress_done ? I18n.t("done") : I18n.t("writing")
  end

  def current_user? user
    self == user
  end
end
