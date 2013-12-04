class SongsController < ApplicationController
  # before_action :require_login
 
  def new
    @api = api
    @user = user
  end

  def search_songs
    @challenge = Challenge.new
    @song = Song.new
    api.search(params[:search_song])
  end

  def add_songs
    @song = @challenge.songs.build
  end

  def create
    api.search(params[:search_song])
  end





  private
 
    def require_login
      unless api
        api = Rdio::Api.new('nwqk6482vnzn47ph332m5e6v', 'TxxUNrJC3v')
      end
      unless user
        user = api.currentUser
      end
    end

end
