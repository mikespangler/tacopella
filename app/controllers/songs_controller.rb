class SongsController < ApplicationController
   # before_action :require_login
 
  def new
    #@api = api
    #@user = user
    @challenge = Challenge.find(params[:id])
    #get back songs
    #chose song

  end

  def search_songs
    @challenge = Challenge.find(params[:id])
  end

  def add_songs
    @song = @challenge.songs.build
  end

  def create_search_results
    @challenge = Challenge.find(params[:id])
    respond_to do |f|
      f.json {render :json => api.search(params[:search_song],types='Song',never_or=nil,extras=nil,count=5)} 
    end  
  end

  def song_results
    @challenge = Challenge.find(params[:id])
    api = Rdio::Api.new('nwqk6482vnzn47ph332m5e6v', 'TxxUNrJC3v')
    @rdio_search = RdioSearch.new(api.search(params[:search_song],types='Song',never_or=nil,extras=nil,count=5))
    render :partial => 'songs/song_results', :format => 'text/html'
  end

  private
 
    def api
      api = Rdio::Api.new('nwqk6482vnzn47ph332m5e6v', 'TxxUNrJC3v')
    end

    def user
      api.currentUser
    end

    def require_login
      api if !api
    end

    #helper_method :api
    helper_method :user

end
