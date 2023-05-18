class User < ApplicationRecord
  include Gravtastic

  NICKNAME_REGEX = /\A\w+\z/.freeze
  EMAIL_REGEX = /.+@.+\..+/.freeze
  COLOR_REGEX = /\A#\h{3}{1,2}\z/.freeze

  has_many :questions, dependent: :delete_all

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true,
            format: { with: EMAIL_REGEX }

  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 },
            format: { with: NICKNAME_REGEX }

  validates :navcolor, format: { with: COLOR_REGEX }, presence: true

  gravtastic(secure: true, filetype: :png, size: 100, default: 'mp')

  has_secure_password

  private

  def downcase_nickname
    nickname&.downcase!
  end
end
