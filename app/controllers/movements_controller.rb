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

  post '/movements' do
    user = Helpers.current_user(session)
    params[:exercises].each do |exercise|
      user.exercises << exercise
    end
    user.save
    
    redirect to '/movements'
  end

end
