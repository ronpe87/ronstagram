require 'rails_helper'

RSpec.describe 'Api::Comments', type: :request do
  let!(:user) { create(:user) }
  let!(:photo) { create(:photo, user: user) }
  let!(:comment) { create_list(:comment, 3, photo: photo, user: user) }

  describe 'GET /api/comments' do
    it '200 Status' do
      get api_comments_path(photo_id: photo.id)
      expect(response).to have_http_status(200)
    end
  end
end
