require "rails_helper"
require "shoulda/matchers"

RSpec.describe Hiring, type: :model do
  describe "Associations" do
    it {should belong_to(:user)}
    it {should belong_to(:vehicle)}
  end

  describe "Validate" do
    it {should validate_presence_of(:time)}
    it {should validate_numericality_of(:time).only_integer}
    it {should validate_numericality_of(:time).is_greater_than_or_equal_to(0)}
  end

  describe "Delegate" do
    it {should delegate_method(:name).to(:vehicle).with_prefix(true)}
  end
end
