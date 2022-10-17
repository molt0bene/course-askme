class User < ApplicationRecord
  include Gravtastic

  has_secure_password
  has_many :questions, dependent: :destroy

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true,
            format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :nickname, presence: true, uniqueness: true, length: {maximum: 40},
            format: { without: /\W/ }
  validates :header_color, format: { with: /\A#\w*\z/ }, length: { maximum: 7 }

  gravtastic(secure: true, filetype: :png, size: 100, default: 'mp')

  private

  def downcase_nickname
    nickname&.downcase!
  end
end
