FactoryBot.define do
  factory :Branch do
    name {FFaker::Address.city}
  end
end
