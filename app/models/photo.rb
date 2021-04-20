class Photo < ApplicationRecord
  belongs_to :user
  has_many_attached :pics
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :content, presence: true

  def comment_count
    comments.count
  end

  def like_count
    likes.count
  end

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end
end
