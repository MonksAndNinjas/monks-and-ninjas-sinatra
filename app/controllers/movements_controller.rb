require './config/environment'

class MovementsController < ApplicationController
  use Rack::Flash
#session {:fail, :success} are used as user validation messages
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

  get '/movements/:slug' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session)
      @movement = Movement.find_by_slug_movement(params[:slug])

      @success = session[:success]
      session[:success] = nil

      erb :'movements/show'
    elsif Helpers.is_logged_in?(session) && !Helpers.registered?(session)
      flash[:message] = "Please complete registration"

      redirect to '/about_me'
    else
      redirect to '/login'
    end
  end

  get '/movements/:slug/new' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session)
      @movement = Movement.find_by_slug_movement(params[:slug])

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

  post '/movements/:slug' do
    @movement = Movement.find_by_slug_movement(params[:slug])
    if !params[:exercise].empty? && Exercise.find_by(desc: params[:exercise]) == nil
      exercise = Exercise.new(desc: params[:exercise])
      @movement.exercises << exercise
      @movement.save

      session[:success] = "Successfully added exercise"

      redirect to "/movements/#{@movement.slug_movement}"
    else
      session[:fail] = "Cannot add empty or existing exercise"

      redirect to "/movements/#{@movement.slug_movement}/new"
    end
  end

  get '/movements/:slug/edit' do
    @movement = Movement.find_by_slug_movement(params[:slug])
    if Helpers.is_logged_in?(session) && Helpers.registered?(session)

      @fail = session[:fail]
      session[:fail] = nil

      erb :'movements/edit'
    elsif Helpers.is_logged_in?(session) && !Helpers.registered?(session)
      flash[:message] = "Please complete registration"

      redirect to '/about_me'
    else
      redirect to '/login'
    end
  end

end
