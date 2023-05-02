class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[a-z\d_+.\-]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/, message: "Проверьте правильно ли введен email" }
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 },
            format: { with: /\A[a-zA-Z_]+\z/, message: "Допустимы только буквы и цифры и знак подчеркивания" }

  def downcase_nickname
    nickname.downcase!
  end
end
