FactoryBot.define do
  factory :user do
    name { "Иван Иванович #{rand(999)}" }
    sequence(:email) { |n| "test_#{n}@test.com" }
    after(:build) { |u| u.password_confirmation = u.password = '123123' }
  end
end
