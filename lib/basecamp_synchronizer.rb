class BasecampSynchronizer < Synchronizer

=begin
=end


  def setup_client
    settings = Settings.integrations.basecamp

    @client ||= OAuth2::Client.new(
      settings.api_client_id,
      settings.api_client_secret,
      site: settings.oauth_url_base,
      authorize_url: settings.oauth_path_authorize,
      token_url: settings.oauth_path_token,
    )
  end


  def api_url(path)
    File.join "https://3.basecampapi.com/", Settings.integrations.basecamp.account_id, path
  end


  def projects
    projects = []
    projects_count = 1000
    page = 1
    requests_limit = 5 #todo
    loop do
      projects += projects_per_page(page)
      break if page >= requests_limit
      page += 1
    end
    projects
  end


  def projects_per_page(page=1)
    url = api_url("/projects.json")
    response = HTTParty.get url, headers: headers, query: {page: page}
    #puts response.headers["x-total-count"]
    handle response
  end


  def headers
    token = ENV["BASECAMP_AUTHENTICATION_TOKEN"]

    {
      "Authorization" => "Bearer #{token}",
      "Content-Type" => "application/json",
      "User-Agent" => "#{Settings.app.name} (Settings.app.email)",
    }
  end

end
