require './config/environment'

class RegistrationsController < ApplicationController

  get '/signup' do
    erb :'registrations/signup'
  end

  post '/signup' do
    if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
      user = User.new(params)
      user.save

      session[:user_id] = user.id

      redirect to '/about_me'
    else
      redirect to '/signup'
    end
  end

  get '/about_me' do
    if Helpers.is_logged_in?(session)
      @user = User.find_by_id(session[:user_id])

      erb :'registrations/about_me'
    else
      redirect to '/login'
    end
  end

end
