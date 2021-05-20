require 'rails_helper'

RSpec.describe 'Photo', type: :system do
  it '記事一覧がひょうじされる' do
    visit root_path
  end
end
