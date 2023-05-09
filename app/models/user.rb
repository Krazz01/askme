class User < ApplicationRecord
  NICKNAME_REGEX = /\A\w+\z/.freeze
  EMAIL_REGEX =  /.+@.+\..+/.freeze


  has_secure_password

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true,
            format: { with: EMAIL_REGEX }

  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 },
            format: { with: NICKNAME_REGEX }

  has_many :questions, dependent: :delete_all

  def downcase_nickname
    nickname.downcase!
  end
end
