class ChallengesController < ApplicationController

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

  def create 
    @challenge = Challenge.new(challenge_params)
    @song = @challenge.songs.build(song_params)
    @challenge.save
    redirect_to invite_friends_path(@challenge)
  end

  def welcome
  end

  def invite_friends
  end

  private

    def challenge_params
      params.require(:challenge).permit(:name, :difficulty)
    end

    def song_params
      params.require(:song).permit(:name)
    end
end
