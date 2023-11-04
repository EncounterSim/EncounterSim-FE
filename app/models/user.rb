class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true

  has_secure_password 
  def standard_login
    password_digest.present? && username.present?
  end
    
  def github_login
    uid.present? && token.present? && username.present?
  end



    has_secure_password
    validates :uid, uniqueness: true, presence: true, if: :github_login
    validates :token, presence: true, if: :github_login

end