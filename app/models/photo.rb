class Photo < ApplicationRecord
  belongs_to :user
  has_many_attached :pics
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :content, presence: true
  validates :content, length: { minimum: 2, maximum: 50 }
  validate :pics_limit

  def pics_limit
    if pics.attached?
      if pics.count >= 4
        errors.add(:pics, 'は3つまで指定できます')
      end
    else
      errors.add(:pics, 'ファイルを添付してください')
    end
  end

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
