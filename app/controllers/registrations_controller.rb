require './config/environment'

class RegistrationsController < ApplicationController

  get '/signup' do
    if Helpers.is_logged_in?(session)
      redirect to '/move'
    else
      erb :'registrations/signup'
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

    if !params[:modalities].empty?
      params[:modalities].each do |modality_id|
        user.fitness_modalities << FitnessModality.find_by_id(modality_id)
      end
    end

    if !params[:modality_name].empty?
      user.fitness_modalities << FitnessModality.new(name: params[:modality_name])
    end

      user.save

      redirect to '/move'
    else
      redirect to '/about_me'
    end
  end

end
