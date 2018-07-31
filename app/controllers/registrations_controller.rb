require './config/environment'

class RegistrationsController < ApplicationController
  use Rack::Flash

  get '/signup' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session)
      redirect to '/move'
    elsif Helpers.is_logged_in?(session) && !Helpers.registered?(session)
      flash[:message] = "Please complete registration"

      redirect to '/about_me'
    else
      erb :'registrations/signup'
    end
  end

  get '/about_me' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session)
      @user = User.find_by_id(session[:user_id])

      redirect to "/users/#{@user.slug}"
    elsif Helpers.is_logged_in?(session) && !Helpers.registered?(session)
      @user = User.find_by_id(session[:user_id])

      erb :'registrations/about_me'
    else
      redirect to '/login'
    end
  end

  post '/signup' do
    user = User.find_by(email: params[:email])
    if user && user.slug == params[:username].gsub(" ", "-").downcase
      flash[:message] = "Account already exists."

      redirect to '/signup'
    elsif !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
      user = User.create(params)

      session[:user_id] = user.id

      redirect to '/about_me'
    else
      flash[:message] = "Please fill-in all the fields"

      redirect to '/signup'
    end
  end

  post '/about_me' do
    if !Helpers.valid_data?(params)

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
