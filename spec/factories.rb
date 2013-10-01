FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "kevin#{n}" }
    sequence(:email) { |n| "foo#{n}@example.com" }
    sequence(:first_name) { |n| "kevin_first#{n}" }
    sequence(:last_name) { |n| "kevin_last#{n}" }
    password '12345678'

  end

  factory :lesson do
    sequence(:title) { |n| "Lesson #{n}" }
    description "Learn you music for great fun!"
    association :teacher, factory: :user

    trait :with_comments do
      after :create do |comment|
        FactoryGirl.create_list(:comment, 2)
      end
    end

    factory :lesson_with_comments, traits: [:with_comments]

  end

  factory :comment do
    sequence(:body) { |n| "Comment #{n} body" }
    association :lesson
    association :user
  end

end
