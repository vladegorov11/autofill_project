FactoryBot.define do
  factory :user do
    password {'password'}
    password_confirmation {'password'}
    email { Faker::Internet.email }
    after(:build) do |u|
      u.confirm
      u.skip_confirmation_notification!
    end
  end
end
