FactoryBot.define do
  factory :reservation do
    association :book
    user_email { Faker::Internet.email }
  end
end
