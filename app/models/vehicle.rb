class Vehicle < ApplicationRecord
  belongs_to :category
  belongs_to :branch
  has_many :hirings
  has_many :comments
end
