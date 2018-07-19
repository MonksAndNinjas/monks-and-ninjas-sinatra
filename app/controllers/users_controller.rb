require './config/environment'

class UsersController < ApplicationController

  get '/login' do
    erb :'sessions/login'
  end

  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect to '/move'
    else
      redirect to '/login'
    end
  end

  get '/move' do
    if Helpers.is_logged_in?(session)
      @user = User.find_by_id(session[:user_id])

      erb :move
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    session.clear

    redirect to '/login'
  end

end
