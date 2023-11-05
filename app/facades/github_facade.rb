class GithubFacade
  def initialize
    @github_service = GithubService.new
  end

  def access_token(params)
    @token = @github_service.oauth_post(params)
  end
  
  def github_user(access_token)
    @github_service.github_user_creation(access_token)
  end
end