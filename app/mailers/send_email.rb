class SendEmail < ActionMailer::Base
  require 'sendgrid-ruby'
  include SendGrid

  def self.test_email(photo)
    @photo = photo
    @photo_user = @photo.user
    from = Email.new(email: '150450050@ccalumni.meijo-u.ac.jp') # SendGridの管理画面でSenderに登録したアドレス
    to = Email.new(email: @photo_user.email) # 送信したいアドレス
    subject = '新しいコメント'
    content = Content.new(type: 'text/plain', value: 'コメントが追加されました。')
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_WEB_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
  end
end
