FactoryBot.define do
  factory :project do
    title {Faker::FunnyName.three_word_name}
    description {Faker::Lorem.sentence(3)}
    project_type {1}
    domain {''}
    user
  end
end
