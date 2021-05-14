FactoryBot.define do
  factory :photo do
    content { Faker::Lorem.characters(number: 3) }
    after(:build) do |photo|
      photo.pics.attach(io: File.open('spec/fixtures/test01.PNG'), filename: 'test01.PNG', content_type: 'image/png')
      photo.pics.attach(io: File.open('spec/fixtures/test02.PNG'), filename: 'test02.PNG', content_type: 'image/png')
      photo.pics.attach(io: File.open('spec/fixtures/test03.PNG'), filename: 'test03.PNG', content_type: 'image/png')
    end
    factory :photo_four do
      content { Faker::Lorem.characters(number: 3) }
      after(:build) do |photo_four|
        photo_four.pics.attach(io: File.open('spec/fixtures/test01.PNG'), filename: 'test01.PNG', content_type: 'image/png')
        photo_four.pics.attach(io: File.open('spec/fixtures/test02.PNG'), filename: 'test02.PNG', content_type: 'image/png')
        photo_four.pics.attach(io: File.open('spec/fixtures/test03.PNG'), filename: 'test03.PNG', content_type: 'image/png')
        photo_four.pics.attach(io: File.open('spec/fixtures/test04.PNG'), filename: 'test04.PNG', content_type: 'image/png')
      end
    end
  end
end
