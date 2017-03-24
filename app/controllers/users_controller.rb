class UsersController < ApplicationController


  def login

  end

  def loginuser
    user = User.find_by(email:params[:email])
    if user
      if user.authenticate params[:password]
        session[:name] = user.first_name
        session[:id] = user.id
        redirect_to '/songs/index'
      else
        flash[:message] = ["User password is incorrect"]
        redirect_to "/"
      end
    else
      flash[:message] = ["User does not exist"]
      redirect_to "/"
    end
  end

  def register
    user = User.create(first_name:params[:first_name], last_name:params[:last_name], email:params[:email], password:params[:password], password_confirmation:params[:password_confirmation])
    if user.valid?
      user.save
      session[:name] = params[:name]
      flash[:message] = ["user created"]
      redirect_to '/'
    else
      flash[:message] = user.errors.full_messages
      redirect_to '/'
    end
  end

  def logout
    reset_session
    redirect_to "/"
  end


  def show
    @user = User.find(params[:id])
    @songs = @user.songs.uniq
    @allsongs = @user.songs
  end




























end
