class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_challenges


  private

  def set_challenges
      @popular_challenges = Challenge.last(5)
  end  

end
