class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :photo
  validates :content, presence: true

  after_create :SendEmail.test_email

  private
  def send_email
    CommentMailer.new_comment(photo).deliver_later
  end

  require 'sendgrid-ruby'
  include SendGrid

  def SendEmail.test_email
    from = Email.new(email: '150450050@ccalumni.meijo-u.ac.jp') # SendGridの管理画面でSenderに登録したアドレス
    to = Email.new(email: 'hananagaronpe@gmail.com') # 送信したいアドレス
    subject = 'テストホゲホゲ'
    content = Content.new(type: 'text/plain', value: 'ハローハロー')
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_WEB_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
  end
end
