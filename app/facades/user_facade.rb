class UserFacade

  def update_and_send_magic_link(user)
    user.update_columns(login_token: SecureRandom.urlsafe_base64, login_token_valid_until: Time.now + 60.minutes)
    url = "https://sleepy-inlet-96410-fb8c75466848.herokuapp.com/sessions/create?login_token=#{user.login_token}"
    LoginMailer.send_email(user, url).deliver_later
  end
end