class LoginMailer < ApplicationMailer
  default from: 'MagicLink@EncounterSim.com'
  def send_email(user, url)
    @user = user
    @url = url
    
    mail to: @user.email, subject: "Sign into EncounterSim!"
  end
end