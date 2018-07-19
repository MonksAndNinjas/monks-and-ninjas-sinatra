require './config/environment'

class UsersController < ApplicationController

  get '/login' do
    if Helpers.is_logged_in?(session)
      redirect to '/move'
    else
      erb :'sessions/login'
    end
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

  get '/users/:slug' do
    if Helpers.is_logged_in?(session)
      @user = User.find_by_slug(params[:slug])

      erb :'users/show'
    else
      redirect to '/login'
    end
  end

  get '/users/:slug/edit' do
    if Helpers.is_logged_in?(session)
      @user = User.find_by_slug(params[:slug])

      erb :'/users/edit'
    else
      redirect to '/login'
    end
  end

  patch '/users/:slug' do
    
  end

  get '/logout' do
    session.clear

    redirect to '/login'
  end

end
