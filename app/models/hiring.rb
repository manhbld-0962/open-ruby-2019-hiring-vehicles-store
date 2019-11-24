class Hiring < ApplicationRecord
  HIRING_PARAMS = %i(vehicle_id time).freeze
  HIRING_UPDATE_PARAMS = %i(status).freeze
  enum status: %i(ordered taking give_back)

  belongs_to :user
  belongs_to :vehicle
  delegate :price, :name, to: :vehicle, prefix: :vehicle
  delegate :branch_name, to: :vehicle
  delegate :name, to: :user, prefix: :user

  validates :time, presence: true

  scope :search, ->(id){id ? Hiring.where(id: id) : Hiring.all}
end
