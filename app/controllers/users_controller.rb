class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      flash[:success] = "You've successfully created your account #{new_user.username}, welcome!"
      session[:user_id] = new_user.id
      redirect_to root_path
    else
      flash[:error] = "There was an issue creating your account, please try again"
      redirect_to new_user_path
    end
  end

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    if user
      user.update!(login_token: SecureRandom.urlsafe_base64, login_token_valid_until: Time.now + 60.minutes)
      url = "http://localhost:5000/sessions/create?login_token=#{user.login_token}"
      LoginMailer.send_email(user, url).deliver_later
      flash[:success] = "Please check your email for login link."
      redirect_to root_path
    else
      flash[:error] = "Email is not associated with an account, please create an account or add another email."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully."
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :username)
  end
end