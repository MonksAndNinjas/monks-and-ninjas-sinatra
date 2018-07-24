require './config/environment'

class UsersController < ApplicationController

  get '/login' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session) == true
      redirect to '/move'
    elsif Helpers.is_logged_in?(session) && Helpers.registered?(session) == false
      redirect to '/about_me'
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
    if Helpers.is_logged_in?(session) && Helpers.registered?(session) == true
      @user = User.find_by_id(session[:user_id])

      erb :move
    elsif Helpers.is_logged_in?(session) && Helpers.registered?(session) == false
      redirect to '/about_me'
    else
      redirect to '/login'
    end
  end

  get '/users/:slug' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session) == true
      @user = User.find_by_slug(params[:slug])

      erb :'users/show'
    elsif Helpers.is_logged_in?(session) && Helpers.registered?(session) == false
      redirect to '/about_me'
    else
      redirect to '/login'
    end
  end

  get '/users/:slug/edit' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session) == true
      @user = User.find_by_slug(params[:slug])

      erb :'/users/edit'
    elsif Helpers.is_logged_in?(session) && Helpers.registered?(session) == false
      redirect to '/about_me'
    else
      redirect to '/login'
    end
  end

  patch '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    @user.fitness_modalities.clear


    @user.update(username: params[:username]) if !params[:username].empty?
    @user.update(password: params[:password]) if !params[:password].empty?
    @user.update(residence: params[:residence]) if !params[:residence].empty?
    @user.update(fitness_level: params[:fitness_level]) if !params[:fitness_level].empty?
    @user.fitness_modalities << FitnessModality.new(name: params[:modality_name]) if !params[:modality_name].empty?
    @user.update(professional: params[:professional])

    if params[:modalities].size > 0
      params[:modalities].each do |modality_id|
        @user.fitness_modalities << FitnessModality.find_by_id(modality_id)
      end
    end
    @user.save

    redirect to "/users/#{@user.slug}"
  end

  get '/logout' do
    session.clear

    redirect to '/login'
  end

end
