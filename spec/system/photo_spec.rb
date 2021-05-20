require 'rails_helper'


RSpec.describe 'Photo', type: :system do
  let!(:user) { create(:user) }
  let!(:photos) { create_list(:photo, 3, user: user) }

  it '記事一覧がひょうじされる' do
    visit root_path
    photos.each do |photo|
      expect(page).to have_css('.photo_bottom_detail', text: photo.content)
    end
  end

  it 'photoの主のプロフを表示できる' do
    visit root_path

    page.first(".photo_bottom_comment").click

    expect(page).to have_content 'Test'
  end
end
