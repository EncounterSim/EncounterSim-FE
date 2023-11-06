class User < ApplicationRecord

  def github_login
    uid.present? && token.present? && username.present?
  end

  def standard_login
    !github_login
  end

  validates :username, uniqueness: true, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, if: :standard_login
  validates :uid, uniqueness: true, presence: true, if: :github_login
  validates :token, presence: true, if: :github_login

  def self.find_user_for_magic_link(params)
    User.where(login_token: params[:login_token]).where('login_token_valid_until > ?', Time.now).first
  end




end