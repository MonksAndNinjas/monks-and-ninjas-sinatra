require './config/environment'

class MonksAndNinjasController < ApplicationController #inherit from

  get '/' do
    erb :home
  end

  get '/about' do
    erb :'monksandninjas/about'
  end

  get '/teachers' do
    erb :'monksandninjas/teachers'
  end

  get '/contact' do
    erb :'monksandninjas/contact'
  end

  get '/events' do
    erb :'monksandninjas/events'
  end


end
