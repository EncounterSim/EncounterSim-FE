class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    new_user = User.create(user_params)
    if new_user.save
      flash[:success] = "You've successfully created your account with #{new_user.email}, welcome!"
      session[:user_id] = new_user.id
      redirect_to root_path
    else !new_user.save
      flash[:error] = "There was an issue creating your account, please try again"
      redirect_to new_user_path
    end
  end

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:success] = "Welcome, #{user.email}!"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Sorry, your credentials are bad."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[notice:] = "Logged out successfully."
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  
end