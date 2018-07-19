require './config/environment'

class PostsController < ApplicationController

  get '/posts/:id' do
    if Helpers.is_logged_in?(session)
      @post = Post.find_by_id(params[:id])

      erb :'posts/show'
    else
      redirect to '/login'
    end
  end

end
