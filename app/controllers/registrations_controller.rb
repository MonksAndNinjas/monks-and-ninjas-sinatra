require './config/environment'

class RegistrationsController < ApplicationController

  get '/signup' do
    erb :'registrations/signup'
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

end
