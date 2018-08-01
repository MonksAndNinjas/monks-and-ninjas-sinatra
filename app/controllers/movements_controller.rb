require './config/environment'

class MovementsController < ApplicationController
  use Rack::Flash

  get '/movements' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session)
      @user = User.find_by_id(session[:user_id])

      erb :'movements/index'
    elsif Helpers.is_logged_in?(session) && !Helpers.registered?(session)
      flash[:message] = "Please complete registration"

      redirect to '/about_me'
    else
      redirect to '/login'
    end
  end

  get '/movements/:name' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session)
      @movement = Movement.find_by(name: params[:name])

      erb :'movements/show'
    elsif Helpers.is_logged_in?(session) && !Helpers.registered?(session)
      flash[:message] = "Please complete registration"

      redirect to '/about_me'
    else
      redirect to '/login'
    end
  end

  get '/movements/:name/new' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session)
      @movement = Movement.find_by(name: params[:name])
      @fail = session[:fail]
      session[:fail] = nil

      erb :'movements/new'
    elsif Helpers.is_logged_in?(session) && !Helpers.registered?(session)
      flash[:message] = "Please complete registration"

      redirect to '/about_me'
    else
      redirect to '/login'
    end
  end

  post '/movements/:name' do
    @movement = Movement.find_by(name: params[:name])
    @exercise = Exercise.new(desc: params[:exercise])
    if !params[:exercise].empty? && @exercise == nil
      @movement.exercises << @exercise
      movement.save

      session[:success] = "Successfully added exercise"

      redirect to "/movements/#{@movement.name}"
    else
      session[:fail] = "Cannot add empty or existing exercise"

      redirect to "/movements/#{@movement.name}/new"
    end
  end

end
