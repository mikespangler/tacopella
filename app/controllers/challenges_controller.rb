class ChallengesController < ApplicationController
  before_action :set_challenges


  
  def index
    @challenges = Challenge.all
  end

  def show 
    @challenge = Challenge.find(params[:id])
    @song_count = 0

    #@songs_array = @challenge.METHOD
    # if !@score
    #   @score = @challenge.scores.build(:value => 0)
    # end
    @song = @challenge.songs[0]
  end

  def get_next_song
    @song_count = params[:song_count].to_i
    @song_count += 1
    @challenge = Challenge.find(params[:id])
    @song = @challenge.songs[@song_count]
    render json: @song.to_json
  end


  def update
    @challenge = Challenge.find(params[:id])
    # guess = params[:guess].downcase.strip
    # song_name = params[:song_name].downcase.strip
    # if guess == song_name
    #   @correct = true
    # else
    #   @correct = false
    # end
    # @score += params [thing]
    #@score = Score.find(params[:id])
    redirect_to show_challenge_path
  end

  def new 
    @challenge = Challenge.new
    @song = Song.new
  end

  def create 
    @challenge = Challenge.create(challenge_params)
    # params[:song].each {|song| @challenge.songs.build(:name => song)}
    @challenge.save
    redirect_to search_songs_path(@challenge)
    # redirect_to invite_friends_path(@challenge)
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
    redirect_to challenges_path
  end

  private

  def set_challenges
      @popular_challenges = Challenge.last(5)
  end  

  def challenge_params
    params.require(:challenge).permit(:difficulty, :name)
  end

end
