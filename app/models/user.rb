class User < ApplicationRecord
  has_secure_password
  has_many :questions, dependent: :destroy

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true,
            format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :nickname, presence: true, uniqueness: true, length: {maximum: 40},
            format: {with: /\w+/}

  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: 'mp')

  private
  def downcase_nickname
    nickname.downcase!
  end
end
