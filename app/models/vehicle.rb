class Vehicle < ApplicationRecord
  VEHICLE_PARAMS =
    %i(name quantity category_id branch_id description price picture).freeze

  belongs_to :category
  belongs_to :branch
  has_many :hirings, dependent: :destroy
  has_many :comments, as: :commentable
  delegate :name, to: :category, prefix: :category
  delegate :name, to: :branch, prefix: :branch

  scope :active_vehicles, ->{where.not quantity: Settings.sold_out}
  mount_uploader :picture, PictureUploader

  validate :picture_size

  private

  def picture_size
    return unless picture.size > Settings.picture_size.megabytes
    errors.add :picture, t(".less")
  end
end
