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
end
