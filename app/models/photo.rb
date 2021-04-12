class Photo < ApplicationRecord
  belongs_to :user
  has_many_attached :pics

  validates :content, presence: true
end
