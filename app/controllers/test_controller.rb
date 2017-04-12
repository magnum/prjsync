require 'oauth2'

class TestController < ApplicationController

  #http://localhost:3000/test/oauth?authorization_code=ec4c46f5
  def oauth
    settings = Settings.integrations.basecamp
    authorization_code = params['authorization_code'] || '601c89e2'
    oauth_callback_url = File.join Settings.app.host, Settings.integrations.basecamp.oauth_path_callback

    begin
      client = OAuth2::Client.new(
        settings.api_client_id,
        settings.api_client_secret,
        site: settings.oauth_url_base,
        authorize_url: settings.oauth_path_authorize,
        token_url: settings.oauth_path_token,
      )
      @url = client.auth_code.authorize_url(redirect_uri: oauth_callback_url)

      @token = client.auth_code.get_token(
        authorization_code, #  get authorization_code_value from previous oauth's  authorize_url call
        :redirect_uri => oauth_callback_url,
        :headers => {}
      )
    rescue OAuth2::Error => e
      @error = e
    end

    #response = token.get('/authorization.json', :params => {})
  end


  def sync
    @channels = Channel.all
  end

end
