class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true

  def standard_login
    password_digest.present? && username.present?
  end
    
  def github_login
    uid.present? && token.present? && username.present?
  end

  if :standard_login
    has_secure_password 
    validates :password, presence: true
  elsif :github_login
    has_secure_password(validations: false)
    validates :uid, uniqueness: true, presence: true
    validates :token, presence: true
  end
end