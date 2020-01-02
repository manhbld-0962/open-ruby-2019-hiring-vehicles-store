require "rails_helper"
require "shoulda/matchers"

RSpec.describe User, type: :model do
  describe "Associations" do
    it {should have_many(:comments)}
    it {should have_many(:hirings)}
  end

  describe "Validate" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}
    it {should validate_uniqueness_of(:email).case_insensitive}
    it {should validate_length_of(:password).is_at_least(6).on(:create)}
    it {should validate_length_of(:password).is_at_most(20).on(:create)}
    it {should allow_value("vuhaison1@gmail.com").for(:email)}
    it {should_not allow_value("foo").for(:email)}
  end

  describe "Downcase" do
    user = FactoryBot.create(:User)
    it {expect(user.email).to eq user.email.downcase}
    user.destroy
  end
end
