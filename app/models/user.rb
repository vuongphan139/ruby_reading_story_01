class User < ApplicationRecord
  before_save :downcase_email, :downcase_account_name
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  SIGNUP_PARAMS = %i(name account_name email password password_confirmation).freeze

  validates :name, presence: true, length: {maximum: Settings.max_length_name}
  validates :account_name, presence: true,
    length: {maximum: Settings.max_length_account_name},
    uniqueness: {case_sensitive: false}
  validates :email, presence: true,
    length: {maximum: Settings.max_length_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    allow_nil: true,
    length: {minimum: Settings.min_length_password}
  has_secure_password

  private

  def downcase_email
    email.downcase!
  end

  def downcase_account_name
    account_name.downcase!
  end
end
