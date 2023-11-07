class UsersController < ApplicationController
  before_action :check_session_expiry, except: [:new, :create, :login_form, :login, :destroy, :session_timeout]
  
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
    if params.values.include?("Get a Magic Link")
      user = User.find_by(email: params[:pemail])
      if user
        UserFacade.new.update_and_send_magic_link(user)
        flash[:success] = "Please check your email for login link."
        redirect_to root_path
      else
        flash[:error] = "Email is not associated with an account, please create an account or add another email."
        redirect_to login_path
      end
    else
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        flash[:success] = "Welcome, #{user.username}!"
        session[:user_id] = user.id
        redirect_to root_path
      else
        flash[:error] = "There was a problem with your credentials, please try again."
        redirect_to login_path
      end
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil # Ensure @current_user is cleared
    flash[:notice] = "Logged out successfully."
    redirect_to root_path
  end

  def session_timeout
    reset_session # Make sure this line is appropriate for your scenario
  
    # Example handling: Redirecting to the login page or rendering a specific view
    flash[:notice] = "Your session has expired. Please log in again."
    redirect_to login_path # Replace 'login_path' with your actual login path
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end


  def check_session_expiry
    if session[:user_id].nil?
      redirect_to session_timeout_path
    else
      reset_session
    end
  end
end