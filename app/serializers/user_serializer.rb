class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :username, :avatar_comment_image
  has_many :comments
  has_one :profile

  def avatar_comment_image
    rails_blob_path(object.avatar_image) if object.avatar_image.attached?
  end
end
