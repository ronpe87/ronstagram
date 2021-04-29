class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :avatar
  has_many :comments
  belongs_to :user
end
