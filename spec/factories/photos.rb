FactoryBot.define do
  factory :photo do
    content { Faker::Lorem.characters(number: 3) }
    after(:build) do |photo|
      photo.pics.attach(io: File.open('spec/fixtures/test01.png'), filename: 'test01.png', content_type: 'image/png')
      photo.pics.attach(io: File.open('spec/fixtures/test02.png'), filename: 'test02.png', content_type: 'image/png')
      photo.pics.attach(io: File.open('spec/fixtures/test03.png'), filename: 'test03.png', content_type: 'image/png')
    end
    factory :photo_four do
      content { Faker::Lorem.characters(number: 3) }
      after(:build) do |photo_four|
        photo_four.pics.attach(io: File.open('spec/fixtures/test01.png'), filename: 'test01.png', content_type: 'image/png')
        photo_four.pics.attach(io: File.open('spec/fixtures/test02.png'), filename: 'test02.png', content_type: 'image/png')
        photo_four.pics.attach(io: File.open('spec/fixtures/test03.png'), filename: 'test03.png', content_type: 'image/png')
        photo_four.pics.attach(io: File.open('spec/fixtures/test04.png'), filename: 'test04.png', content_type: 'image/png')
      end
    end
  end
end
