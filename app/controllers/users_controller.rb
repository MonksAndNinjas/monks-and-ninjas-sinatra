require './config/environment'

class UsersController < ApplicationController

  get '/login' do
    erb :'sessions/login'
  end

end
