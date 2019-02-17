class Interactive < ApplicationRecord
  belongs_to :user
  belongs_to :story
  enum interactive_type: {like: 1, follow: 2}
end
