class Hiring < ApplicationRecord
  HIRING_PARAMS = %i(vehicle_id time).freeze
  HIRING_UPDATE_PARAMS = %i(status).freeze
  enum status: %i(ordered taking give_back)

  belongs_to :user
  belongs_to :vehicle

  validates :time, presence: true
  validates :time, numericality: {greater_than_or_equal_to: Settings.min_time}
  validates :time, numericality: {only_integer: true}

  delegate :price, :name, to: :vehicle, prefix: :vehicle
  delegate :branch_name, to: :vehicle
  delegate :name, to: :user, prefix: :user

  scope :taking, ->{where("give_back_time < ?", Time.zone.now)}
  scope :monthly_statistic, ->{group_by_month(:created_at).size}
  ransacker :created_at do
    Arel.sql("date(created_at)")
  end
end
