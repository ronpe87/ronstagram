require 'rails_helper'

RSpec.describe 'Photos', type: :request do
  let!(:user) { create(:user) }
  let!(:photos) { create_list(:photo, 3, user: user) }

  describe 'GET /photos' do
    it '200ステータスが帰って来る' do
      get photos_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /photos' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      it '記事が保存されている' do
        photo_params = attributes_for(:photo)
        post photos_path({photo: photo_params})
        expect(response).to have_http_status(302)
        expect(Photo.last.content).to eq(photo_params[:content])
        # model/photo.rbのlimitを消せば通る
      end
    end
  end
end
