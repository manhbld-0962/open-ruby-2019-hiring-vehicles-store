FactoryBot.define do
  factory :Vehicle do
    name {FFaker::Vehicle.drivetrain}
    quantity {0}
    branch_id {1}
    category_id {1}
    price {200000}
  end
end
