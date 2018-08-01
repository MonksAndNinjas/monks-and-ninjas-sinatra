require './config/environment'

class PostsController < ApplicationController
  use Rack::Flash
#session {:fail, :success} are used as user validation messages
  get '/posts' do                                         
    if Helpers.is_logged_in?(session) && Helpers.registered?(session)
      @user = User.find_by_id(session[:user_id])

      @delete = session[:delete]                          #from delete '/posts/:id/delete'
      session[:delete] = nil

      @success = session[:success]                        #from post '/posts', created post
      session[:success] = nil

      erb :'posts/index'
    elsif Helpers.is_logged_in?(session) && !Helpers.registered?(session)
      flash[:message] = "Please complete registration"

      redirect to '/about_me'
    else
      redirect to '/login'
    end
  end

  get '/posts/new' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session)

      @fail = session[:fail]                               #from post '/posts', prevents empty post
      session[:fail] = nil

      erb :'posts/new'
    elsif Helpers.is_logged_in?(session) && !Helpers.registered?(session)
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

      redirect to '/posts'
    else
      session[:fail] = "Cannot create empty post"

      redirect to '/posts/new'
    end
  end

  get '/posts/:id' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session)
      @post = Post.find_by_id(params[:id])                #do I just need user?

      @success = session[:success]                        #from patch '/posts/:id', post failed
      session[:success] = nil

      erb :'posts/show'
    elsif Helpers.is_logged_in?(session) && !Helpers.registered?(session)
      flash[:message] = "Please complete registration"

      redirect to '/about_me'
    else
      redirect to '/login'
    end
  end

  get '/posts/:id/edit' do
    if Helpers.is_logged_in?(session) && Helpers.registered?(session)
      @post = Post.find_by_id(params[:id])

      @fail = session[:fail]                               #from patch '/posts/:id', post created
      session[:fail] = nil

      erb :'posts/edit'
    elsif Helpers.is_logged_in?(session) && !Helpers.registered?(session)
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

    redirect to '/posts'
  end

end
