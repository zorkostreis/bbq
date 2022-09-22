FactoryBot.define do
  factory :event do
    association :user
    title { 'Megaparty' }
    address { 'Зеленоград' }
    datetime { DateTime.parse('01.12.2022 12:00') }
  end
end
