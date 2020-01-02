FactoryBot.define do
  factory :Category do
    name {FFaker::Vehicle.model}
  end
end
