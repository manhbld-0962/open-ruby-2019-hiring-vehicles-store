require "rails_helper"
require "shoulda/matchers"

RSpec.describe Vehicle, type: :model do
  describe "Association" do 
    it {should belong_to(:category)}
    it {should belong_to(:branch)}
    it {should have_many(:hirings)}
    it {should have_many(:comments)}
  end

  describe "Validate" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:quantity)}
    it {should validate_numericality_of(:quantity).only_integer}
    it {should validate_length_of(:name).is_at_most(Settings.vehicle_name_length_max).on(:create)}
  end

  describe "Scope" do
    FactoryBot.create(:Branch)
    FactoryBot.create(:Category)
    FactoryBot.create(:Vehicle)
    it { expect(Vehicle.active_vehicles).to eq [] }
  end
end
