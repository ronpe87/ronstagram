require 'rails_helper'

RSpec.describe Photo, type: :model do
  let!(:user) { create(:user) }

  context '内容と画像が入力されている場合' do
    let!(:photo) do
      user.photos.build({
        content: Faker::Lorem.characters(number: 3),
        pics: 'app/assets/images/camera.png'
      })
    end

    it '記事を保存できる' do
      expect(photo).to be_valid
    end
  end

  context 'contentの文字が１文字の場合' do
    let!(:photo) do
      user.photos.create({
        content: Faker::Lorem.characters(number: 1),
        pics: 'app/assets/images/camera.png'
      })
    end

    it '記事を保存できない' do
      expect(photo.errors.messages[:content][0]).to eq('は2文字以上で入力してください')
    end
  end
end
