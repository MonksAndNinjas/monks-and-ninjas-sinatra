require './config/environment'

class MovementsController < ApplicationController
  use Rack::Flash

  get '/movements' do
    erb :'movements/index'
  end
end
