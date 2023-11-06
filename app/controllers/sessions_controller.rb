class SessionsController < ApplicationController
  def create
    user = User.find_user_for_magic_link(params) 
    if user
      user.update_columns(login_token: nil, login_token_valid_until: 1.year.ago)
      session[:user_id] = user.id
      flash[:Success] = "Congrats, you are signed in!"
      redirect_to root_path
    else
      flash[:error] = "Invalid or expired login link"
      redirect_to root_path
    end
  end
end