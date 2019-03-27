FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    password { "12345678" }
  end
end