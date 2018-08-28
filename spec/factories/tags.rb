FactoryBot.define do
  factory :tag do
    name {Faker::Appliance.unique.brand}
    groups
  end
end
