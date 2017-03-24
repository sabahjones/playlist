class SongsController < ApplicationController

  def index
    @songs = Song.all
    @songs = @songs.order(created_at: :desc)
    @songlist = Songlist.all
    @count = 0
  end

  def show
    @song = Song.find(params[:id])
    @listeners = @song.listeners.uniq

    @songlist = Songlist.where(song_id:params[:id])
    @count = 0
    @users = User.all
  end

  def create
    song = Song.create(title:params[:title], artist:params[:artist])
    if song.valid?
    else
      flash[:message] = song.errors.full_messages
    end
    redirect_to '/songs/index'
  end

  def add
    Songlist.create(song_id:params[:id], user_id:session[:id])
    redirect_to '/songs/index'
  end
end
