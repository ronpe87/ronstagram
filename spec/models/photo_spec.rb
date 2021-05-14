require 'rails_helper'

RSpec.describe Photo, type: :model do
  let!(:user) { create(:user) }

  context '内容と画像3枚が入力されている場合' do
    let!(:photo) { build(:photo, user: user) }

    it '記事を保存できる' do
      expect(photo).to be_valid
    end
  end

  context '内容と画像4枚が入力されている場合' do
    let!(:photo_four) { build(:photo_four, user: user) }

    before do
      photo_four.save
    end

    it '記事を保存できない' do
      expect(photo_four.errors.messages[:pics][0]).to eq('は３枚以下で入力してください')
    end
  end
end
