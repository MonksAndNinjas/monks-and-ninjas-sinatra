require './config/environment'

class PostsController < ApplicationController
  use Rack::Flash

  get '/posts/new' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session) == true
      @fail = session[:error]
      session[:error] = nil

      erb :'posts/new'
    elsif Helpers.is_logged_in?(session) && Helpers.registered?(session) == false
      flash[:message] = "Please complete registration"

      redirect to '/about_me'
    else
      redirect to '/login'
    end
  end

  post '/posts' do
    if !params[:content].empty?
      user = User.find_by_id(session[:user_id])
      post = Post.new(content: params[:content])
      user.posts << post
      user.save

      session[:success] = "Successfully created post"

      redirect to '/move'
    else
      session[:error] = "Cannot create empty post"

      redirect to '/posts/new'
    end
  end

  get '/posts/:id' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session) == true
      @post = Post.find_by_id(params[:id])
      @user = User.find_by_id(session[:user_id])

      erb :'posts/show'
    elsif Helpers.is_logged_in?(session) && Helpers.registered?(session) == false
      flash[:message] = "Please complete registration"

      redirect to '/about_me'
    else
      redirect to '/login'
    end
  end

  get '/posts/:id/edit' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session) == true
      @post = Post.find_by_id(params[:id])

      erb :'posts/edit'
    elsif Helpers.is_logged_in?(session) && Helpers.registered?(session) == false
      flash[:message] = "Please complete registration"

      redirect to '/about_me'
    else
      redirect to '/login'
    end
  end

  patch '/posts/:id' do
    post = Post.find_by_id(params[:id])
    post.content = params[:content]
    post.save

    redirect to "/posts/#{post.id}"
  end

  delete '/posts/:id/delete' do
    post = Post.find_by_id(params[:id])
    post.delete

    redirect to '/move'
  end

end
