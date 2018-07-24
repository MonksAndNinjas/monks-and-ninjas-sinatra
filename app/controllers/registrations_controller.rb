require './config/environment'

class RegistrationsController < ApplicationController
  use Rack::Flash

  get '/signup' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session) == true
      redirect to '/move'
    elsif Helpers.is_logged_in?(session) && Helpers.registered?(session) == false
      flash[:message] = "Please complete registration"

      redirect to '/about_me'
    else
      erb :'registrations/signup'
    end
  end

  get '/about_me' do

    if Helpers.is_logged_in?(session) && Helpers.registered?(session) == false
      @user = User.find_by_id(session[:user_id])

      erb :'registrations/about_me'
    elsif Helpers.is_logged_in?(session) && Helpers.registered?(session) == true
      @user = User.find_by_id(session[:user_id])

      redirect to "/users/#{@user.slug}"
    else
      redirect to '/login'
    end
  end

  post '/signup' do
    user = User.find_by(email: params[:email])
    if user && user.slug == params[:username].gsub(" ", "-").downcase
      flash[:message] = "Username or email already exists."

      redirect to '/signup'
    elsif !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
      user = User.new(params)
      user.save

      session[:user_id] = user.id

      redirect to '/about_me'
    else
      flash[:message] = "Please fill-in all the fields"
      
      redirect to '/signup'
    end
  end

  post '/about_me' do
    if params[:residence].empty? || params[:professional].empty? || params[:fitness_level].empty? || (params[:modalities] == nil && params[:modality_name].empty?)
      flash[:message] = "Make sure to complete all fields, choose a specialty or fill-in a new specialty"

      redirect to '/about_me'
    else
      user = User.find_by_id(session[:user_id])
      user.update(residence: params[:residence], professional: params[:professional], fitness_level: params[:fitness_level])

      if params[:modalities] != nil
        params[:modalities].each do |modality_id|
          user.fitness_modalities << FitnessModality.find_by_id(modality_id)
        end
      end

      if !params[:modality_name].empty?
        user.fitness_modalities << FitnessModality.new(name: params[:modality_name])
      end

      user.save

      redirect to '/move'
    end
  end

end
