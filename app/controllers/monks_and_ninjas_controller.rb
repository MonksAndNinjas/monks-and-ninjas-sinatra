require './config/environment'

class MonksAndNinjasController < ApplicationController #inherit from

  get '/' do
    erb :home
  end

end
