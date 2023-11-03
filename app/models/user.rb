class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, if: :standard_login?

  has_secure_password validations: false

  def standard_login?
    password_digest.present? && email.present?
  end

  validates :uid, uniqueness: true, presence: true, if: :github_login?
  validates :token, presence: true, if: :github_login?
  validates :username, presence: true, if: :github_login?


  def github_login?
    uid.present? && token.present? && username.present?
  end

end