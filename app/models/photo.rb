class Photo < ApplicationRecord
  validates :content, presence: true
end
