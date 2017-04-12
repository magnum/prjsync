require 'oauth2'

class TestController < ApplicationController


  def oauth2
    client = OAuth2::Client.new(
      Settings.integrations.basecamp.client_id,
      Settings.integrations.basecamp.client_secret,
      site: "https://launchpad.37signals.com",
      authorize_url: "/authorization/new?type=web_server",
    )
    url = client.auth_code.authorize_url(:redirect_uri => "http://prjsync.herokuapp.com/oauth2/callback/basecamp")
    render text: url
  end


end
