require './config/environment'

class RegistrationsController < ApplicationController

  get '/signup' do
    erb :'registrations/signup'
  end

end