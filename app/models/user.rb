class User < ApplicationRecord
  has_many :comments
  has_many :hirings
  validates :name, presence: true,
    length: {maximum: Settings.user_name_length_max}
  validates :email, presence: true,
    length: {maximum: Settings.user_email_length_max},
    format: {with: Settings.valid_email}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.user_pass_length_min, maximum:
      Settings.password_max_length}, allow_nil: true
  before_save :downcase_email
  USER_PARAMS = %i(name email password password_confirmation).freeze
  has_secure_password

  private

  def downcase_email
    email.downcase!
  end
end
