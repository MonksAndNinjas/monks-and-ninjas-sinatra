require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    set :public_dir, "public"

    enable :sessions
    set :session_secret, "secret"
  end

end
