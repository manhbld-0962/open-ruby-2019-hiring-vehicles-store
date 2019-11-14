class Hiring < ApplicationRecord
  HIRING_PARAMS = %i(vehicle_id time).freeze

  belongs_to :user
  belongs_to :vehicle

  validates :time, presence: true
end
