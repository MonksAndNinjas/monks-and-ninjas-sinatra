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

  get '/movements/:slug_movement' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session)
      user = Helpers.current_user(session)
      @movement = Movement.find_by_slug_movement(params[:slug_movement])
      @exercise_list = user.exercises.find_all {|exercise| exercise.movement_id == @movement.id}

      @success = session[:success]                          #from post '/movement/:slug_movement', added exercise
      session[:success] = nil

      @delete = session[:delete]                            #from delete '/movements/:slug_movement/:id/delete'
      session[:delete] = nil

      erb :'movements/show1'
    elsif Helpers.is_logged_in?(session) && !Helpers.registered?(session)
      flash[:message] = "Please complete registration"

      redirect to '/about_me'
    else
      redirect to '/login'
    end
  end

  get '/movements/:slug_movement/new' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session)
      @movement = Movement.find_by_slug_movement(params[:slug_movement])

      @fail = session[:fail]                               #from post '/movements/:slug_movement/:id', exercise not added
      session[:fail] = nil

      erb :'movements/new'
    elsif Helpers.is_logged_in?(session) && !Helpers.registered?(session)
      flash[:message] = "Please complete registration"

      redirect to '/about_me'
    else
      redirect to '/login'
    end
  end

  post '/movements/:slug_movement' do
    movement = Movement.find_by_slug_movement(params[:slug_movement])
    if !params[:title].empty?                                   #prevents creating an empty title
      exercise = Exercise.new(title: params[:title])
      user = Helpers.current_user(session)
      movement.exercises << exercise
      user.exercises << exercise
      user.save

      session[:success] = "Successfully added exercise"

      redirect to "/movements/#{movement.slug_movement}"
    else
      session[:fail] = "Cannot add empty or existing exercise"

      redirect to "/movements/#{movement.slug_movement}/new"
    end
  end

  get '/movements/:slug_movement/:id' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session)
      @movement = Movement.find_by_slug_movement(params[:slug_movement])
      @exercise = Exercise.find_by_id(params[:id])

      @success = session[:success]
      session[:success] = nil                              #from patch '/movements/:slug_movement/:id', exercises edited

      erb :'movements/show2'
    elsif Helpers.is_logged_in?(session) && !Helpers.registered?(session)
      flash[:message] = "Please complete registration"

      redirect to '/about_me'
    else
      redirect to '/login'
    end
  end

  get '/movements/:slug_movement/:id/edit' do
    user = Helpers.current_user(session)                #cannot edit someone elses movement organizer
    if Helpers.is_logged_in?(session) && Helpers.registered?(session) && user.exercises.find_by_id(params[:id]) != nil
      @movement = Movement.find_by_slug_movement(params[:slug_movement])
      @exercise = Exercise.find_by_id(params[:id])

      @fail = session[:fail]                               #from patch '/movements/:slug_movement/:id', exercise not edited
      session[:fail] = nil

      erb :'movements/edit'
    elsif Helpers.is_logged_in?(session) && !Helpers.registered?(session)
      flash[:message] = "Please complete registration"

      redirect to '/about_me'
    else
      redirect to '/login'
    end
  end

  patch '/movements/:slug_movement/:id' do
    movement = Movement.find_by_slug_movement(params[:slug_movement])
    exercise = Exercise.find_by_id(params[:id])
    if !params[:title].empty? && Helpers.current_user(session).exercises.find_by_id(params[:id]) != nil
      exercise.update(title: params[:title])

      session[:success] = "Successfully edited exercise"

      redirect to "/movements/#{movement.slug_movement}/#{exercise.id}"
    else
      session[:fail] = "Cannot have an empty or exisiting exercise"

      redirect to "/movements/#{movement.slug_movement}/#{exercise.id}/edit"
    end
  end

  delete '/movements/:slug_movement/:id/delete' do
    if Helpers.current_user(session).exercises.find_by_id(params[:id]) != nil
      movement = Movement.find_by_slug_movement(params[:slug_movement])
      exercise = Exercise.find_by_id(params[:id])
      exercise.delete

      session[:delete] = "Successfully deleted exercise"

      redirect to "/movements/#{movement.slug_movement}"
    else
      redirect to '/movements'
    end
  end

end
