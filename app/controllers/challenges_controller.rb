class ChallengesController < ApplicationController
  before_action :set_challenges
  
  def index
    @challenges = Challenge.all
  end

  def show 
    @challenge = Challenge.find(params[:id])
  end

  def new 
    @challenge = Challenge.new
    @song = Song.new
  end

  def yer_done
  end

  def create 
    @challenge = Challenge.create(challenge_params)
    # params[:song].each {|song| @challenge.songs.build(:name => song)}
    @challenge.save
    redirect_to search_songs_path(@challenge)
    # redirect_to invite_friends_path(@challenge)
  end

  def update
    @challenge = Challenge.find(params[:id])
    @song = @challenge.songs.build({:play_key => params[:key], :name => params[:song]})
    @song.save
    render :partial => 'challenges/preview', :format => 'text/html'
  end

  def welcome
    @challenges = Challenge.all
  end

  def invite_friends_form
    @challenge = Challenge.find(params[:id])
  end

  # POST /challenges/invite-friends
  # reminder to self: Create validations
  def invite_friends
    @challenge = Challenge.find(params[:id])
    receivers_arr = params[:receivers].gsub(" ", "").split(",")
    receivers_arr.each do |receiver|
      ChallengeMailer.invite_friends(params[:sender], receiver, @challenge).deliver
    end
    redirect_to yer_done_path
  end

  private

  def set_challenges
      @popular_challenges = Challenge.last(5)
  end  

  def challenge_params
    params.require(:challenge).permit(:difficulty, :name)
  end

end
