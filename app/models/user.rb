class User < ApplicationRecord
  NICKNAME_REGEX = /\A\w+\z/.freeze
  EMAIL_REGEX = /\A[a-z\d_+.\-]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/.freeze

  has_secure_password

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true,
            format: { with: EMAIL_REGEX }

  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 },
            format: { with: NICKNAME_REGEX }

  def downcase_nickname
    nickname.downcase!
  end
end
