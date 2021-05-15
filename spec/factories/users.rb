FactoryBot.define do
  factory :user do
    username { 'testman' }
    email { Faker::Internet.email }
    password { 'password' }
  end
end
