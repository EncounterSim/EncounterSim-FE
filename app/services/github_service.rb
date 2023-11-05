class GithubService

  def conn_oauth
    conn = Faraday.new(url: 'https://github.com', headers: {'Accept': 'application/json'})
  end

  def oauth_post(params)
    github_credentials = Rails.application.credentials.github
    code = params[:code]
    response = conn_oauth.post('/login/oauth/access_token') do |req|
      req.params['code'] = code
      req.params['client_id'] = github_credentials[:client_id]
      req.params['client_secret'] = github_credentials[:client_secret]
    end
    data = JSON.parse(response.body, symbolize_names: true)[:access_token]
  end

  def conn_user(access_token)
    conn = Faraday.new(
      url: 'https://api.github.com',
      headers: {
        'Authorization': "token #{access_token}"
      }
      )
  end

  def github_user_creation(access_token)
    response = conn_user(access_token).get('/user')
    data = JSON.parse(response.body, symbolize_names: true)
  end
end