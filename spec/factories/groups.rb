FactoryBot.define do
  factory :group do
    description {'i'*100}
    name { Faker::Lorem.sentence(3)}
    project
  end
end
