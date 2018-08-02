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
      user = Helpers.current_user(session)
      @movement = Movement.find_by_slug_movement(params[:slug])
      @exercise_list = user.exercises.find_all {|exercise| exercise.movement_id == @movement.id}


      @success = session[:success]
      session[:success] = nil

      @delete = session[:delete]
      session[:delete] = nil

      erb :'movements/show1'
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
    if !params[:desc].empty? && Exercise.find_by(desc: params[:desc]) == nil
      exercise = Exercise.new(desc: params[:desc])
      user = Helpers.current_user(session)
      @movement.exercises << exercise
      user.exercises << exercise
      user.save

      session[:success] = "Successfully added exercise"

      redirect to "/movements/#{@movement.slug_movement}"
    else
      session[:fail] = "Cannot add empty or existing exercise"

      redirect to "/movements/#{@movement.slug_movement}/new"
    end
  end

  get '/movements/:slug/:id' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session)
      @exercise = Exercise.find_by_id(params[:id])
      @movement = Movement.find_by_slug_movement(params[:slug])

      @success = session[:success]
      session[:success] = nil

      erb :'movements/show2'
    elsif Helpers.is_logged_in?(session) && !Helpers.registered?(session)
      flash[:message] = "Please complete registration"

      redirect to '/about_me'
    else
      redirect to '/login'
    end
  end

  get '/movements/:slug/:id/edit' do
    @movement = Movement.find_by_slug_movement(params[:slug])
    @exercise = Exercise.find_by_id(params[:id])
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

  patch '/movements/:slug/:id' do
    @exercise = Exercise.find_by_id(params[:id])
    @movement = Movement.find_by_slug_movement(params[:slug])
    if !params[:desc].empty? && Exercise.find_by(desc: params[:desc]) == nil
      @exercise.update(desc: params[:desc])

      session[:success] = "Successfully edited exercise"

      redirect to "/movements/#{@movement.slug_movement}/#{@exercise.id}"
    else
      session[:fail] = "Cannot have an empty or exisiting exercise"

      redirect to "/movements/#{@movement.slug_movement}/#{@exercise.id}/edit"
    end
  end

  delete '/movements/:slug/:id/delete' do
    exercise = Exercise.find_by_id(params[:id])
    exercise.delete
    movement = Movement.find_by_slug_movement(params[:slug])

    session[:delete] = "Successfully deleted exercise"

    redirect to "/movements/#{movement.slug_movement}"
  end

end
