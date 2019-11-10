class Hiring < ApplicationRecord
  HIRING_PARAMS = %i(vehicle_id).freeze

  belongs_to :user
  belongs_to :vehicle
end
