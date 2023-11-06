class GithubController < ApplicationController
  def create
    access_token = GithubFacade.new.access_token(params)
    github_facade = GithubFacade.new.github_user(access_token)
      
      user          = User.find_or_create_by(uid: github_facade[:id])
      user.username = github_facade[:login]
      user.uid      = github_facade[:id]
      user.token    = access_token
      user.password = "#{github_facade[:id]}#{github_facade[:login]}"
      user.save
    session[:user_id] = user.id
    flash[:success] = "You've successfully logged into your account #{user.username}, welcome!"

    redirect_to root_path
  end
end