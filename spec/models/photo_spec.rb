require 'rails_helper'

RSpec.describe Photo, type: :model do
  let!(:user) { create(:user) }

  context '内容と画像3枚が入力されている場合' do
    let!(:photo) { build(:photo, user: user) }

    it '記事を保存できる' do
      expect(photo).to be_valid
    end
  end
end
