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
  end
end
