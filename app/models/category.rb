class Category < ApplicationRecord
  has_many :vehicles, dependent: :destroy
end
