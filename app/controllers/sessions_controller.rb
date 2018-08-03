require './config/environment'

class SessionsController < ApplicationController
  use Rack::Flash
  #session {:logout, :success, :delete, :fail} is used as user validation message
  get '/login' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session)
      redirect to '/posts'
    elsif Helpers.is_logged_in?(session) && !Helpers.registered?(session)
      flash[:message] = "Please complete registration"

      redirect to '/about_me'
    else
      @logout = session[:logout]                            #from get '/logout', users_controller
      session[:logout] = nil

      @fail = session[:fail]                                #redirected from any pager if not logged in
      session[:fail] = nil

      erb :'sessions/login'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect to '/posts'
    else
      session[:fail] = "Invalid username or password"

      redirect to '/login'
    end
  end

end
