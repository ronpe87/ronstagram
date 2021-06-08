class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :photo
  validates :content, presence: true

  after_create :send_email

  private
  def send_email
    SendEmail.test_email
  end
end
