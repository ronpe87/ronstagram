class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :username, :avatar_comment_image
  has_many :comments
  has_one :profile

  def avatar_comment_image
    if object.avatar_image != 'default-avatar.png'
      rails_blob_path(object.avatar_image) # if object.avatar_image.attachment
    else
      '/assets/default-avatar.png' #jsにてimg srcで表示させようとしているのに/assets/を前につけなかったから動作しなかった。フォルダ指定必須。
    end
  end
end
