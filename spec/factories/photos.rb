FactoryBot.define do
  factory :photo do
    content { Faker::Lorem.characters(number: 3) }
    after(:build) do |photo|
      photo.pics.attach(io: File.open('spec/fixtures/test01.PNG'), filename: 'test01.PNG', content_type: 'image/png')
      photo.pics.attach(io: File.open('spec/fixtures/test02.PNG'), filename: 'test02.PNG', content_type: 'image/png')
      photo.pics.attach(io: File.open('spec/fixtures/test03.PNG'), filename: 'test03.PNG', content_type: 'image/png')
    end
  end
end
