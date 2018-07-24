require './config/environment'

class PostsController < ApplicationController
  use Rack::Flash

  get '/posts/new' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session) == true

      @fail = session[:error]
      session[:fail] = nil

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
      session[:fail] = "Cannot create empty post"

      redirect to '/posts/new'
    end
  end

  get '/posts/:id' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session) == true
      @post = Post.find_by_id(params[:id])
      @user = User.find_by_id(session[:user_id])

      @success = session[:success]
      session[:success] = nil

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

      @fail = session[:fail]
      session[:fail] = nil

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

  delete '/posts/:id/delete' do
    post = Post.find_by_id(params[:id])
    post.delete

    session[:delete] = "Successfully deleted post"

    redirect to '/move'
  end

end
