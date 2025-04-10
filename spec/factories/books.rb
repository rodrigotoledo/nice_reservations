FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    reserved { false }

    trait :with_reservation do
      reserved { true }
      after(:create) do |book|
        create(:reservation, book: book, user_email: Faker::Internet.email)
      end
    end
  end
end
