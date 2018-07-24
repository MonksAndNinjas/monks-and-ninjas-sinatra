require './config/environment'

class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    set :views, 'app/views'       #set views

    enable :sessions
    set :session_secret, "secret"
  end

end
