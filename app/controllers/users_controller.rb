require './config/environment'

class UsersController < ApplicationController

  get '/login' do
    erb :'sessions/login'
  end

  get '/move' do
    @user = User.find_by_id(session[:user_id])
    erb :move
  end

end
