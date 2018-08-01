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
    post = Post.find_by_id(params[:id])
    if !params[:content].empty?
      post.content = params[:content]
      post.save

      session[:success] = "Successfully edited post"

      redirect to "/posts/#{post.id}"
    else
      session[:fail] = "Cannot create empty post"

      redirect to "/posts/#{post.id}/edit"
    end
  end

end
