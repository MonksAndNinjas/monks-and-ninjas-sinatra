require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'       #set views

    enable :sessions
    set :session_secret, "secret"
  end

end
