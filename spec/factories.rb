FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@example.com" }
    password '12345678'
  end

  factory :lesson do
    sequence(:title) { |n| "Lesson #{n}" }
    description "Learn you music for great fun!"
    association :teacher, factory: :user
  end
end
