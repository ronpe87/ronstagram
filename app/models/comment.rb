class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :photo
  validates :content, presence: true

  after_create :send_email

  private
  def send_email
    SendEmail.test_email(photo) #開発環境、Herokuどちらでもメール画面にて閲覧可能
    CommentMailer.new_comment(photo).deliver_later #開発環境でletter_openerにて閲覧可能
  end
end
