require './config/environment'

class RegistrationsController < ApplicationController

  get '/signup' do
    erb :'registrations/signup'
  end

  get '/about_me' do
    if Helpers.is_logged_in?(session)
      @user = User.find_by_id(session[:user_id])

      erb :'registrations/about_me'
    else
      redirect to '/login'
    end
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

  post '/about_me' do
    if !params[:residence].empty? && !params[:professional].empty? && !params[:fitness_level].empty?
      user = User.find_by_id(session[:user_id])
      user.update(residence: params[:residence], professional: params[:professional], fitness_level: params[:fitness_level])
      user.save

      if !parmas[:modality_name].empty?

      redirect to '/move'
    else
      redirect to '/about_me'
    end
  end

end
