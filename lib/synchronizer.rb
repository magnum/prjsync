class Synchronizer

  def initialize

  end


  def projects
    raise 'not implemented'
  end

  def setup_client
    raise 'not implemented'
  end


  def oauth_callback_url
    File.join Settings.app.host, Settings.integrations.basecamp.path_oauth_callback
  end


  def handle response
    if response.code == 200
      JSON.parse(response.body)
    else
      puts response.inspect
      nil
    end
  end



  # implemented http://stackoverflow.com/questions/23075010/running-a-method-after-the-initialize-method
  # look also at http://stackoverflow.com/questions/5513558/executing-code-for-every-method-call-in-a-ruby-module
  class << self
    alias_method :_new, :new

    def new
      _new.tap do |instance|
        instance.send(:setup_client)
      end
    end

  end


  private

  def setup_client
    puts "setup_client method HAS TO BE IMPLEMENTED!"
  end


end
