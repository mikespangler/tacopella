class ChallengesController < ApplicationController

  def index
    @challenges = Challenge.all
  end

  def show 
    render :layout => false
    @challenge = Challenge.find(params[:id])
  end

  def new 
    @challenge = Challenge.new
    @song = Song.new
  end

  def create 
    @challenge = Challenge.create(challenge_params)
    # params[:song].each {|song| @challenge.songs.build(:name => song)}
    @challenge.save
    render 'add_songs'
    # redirect_to invite_friends_path(@challenge)
  end

  def welcome
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
    redirect_to challenges_path
  end

  private

  def challenge_params
    params.require(:challenge).permit(:difficulty, :name)
  end

end
