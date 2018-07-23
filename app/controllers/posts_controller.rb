require './config/environment'

class PostsController < ApplicationController

  get '/posts/new' do
    if Helpers.is_logged_in?(session)

      erb :'posts/new'
    else
      redirect to '/login'
    end
  end

  posts '/posts' do
    user = User.find_by_id(session[:user_id])
    post = Post.new(content: params[:content])
    user.posts << post
    user.save
    
    redirect to '/move'
  end

  get '/posts/:id' do
    if Helpers.is_logged_in?(session)
      @post = Post.find_by_id(params[:id])
      @user = User.find_by_id(session[:user_id])

      erb :'posts/show'
    else
      redirect to '/login'
    end
  end

  get '/posts/:id/edit' do
    if Helpers.is_logged_in?(session)
      @post = Post.find_by_id(params[:id])

      erb :'posts/edit'
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

end
