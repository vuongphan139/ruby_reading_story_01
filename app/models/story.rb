class Story < ApplicationRecord
  belongs_to :user
  has_many :chapters, dependent: :destroy
  has_many :comments
  has_many :interactives
  has_and_belongs_to_many :categories
  scope :newest, ->{order created_at: :desc}

  validates :name, presence: true
  validates :author_name, presence: true
  validates :progress, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  mount_uploader :cover_image, PictureUploader
  validates_presence_of :cover_image

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
