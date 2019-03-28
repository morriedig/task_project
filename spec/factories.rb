FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    password { "12345678" }
  end

  factory :task do
    sequence(:title) { |n| "task#{n}" }
    content { "This is task's content" }
    status { "pending" }
    priority { 1 }
    finish_time { "2019-03-29" }
    user_id { 1 }
  end
end