class Challenge < ActiveRecord::Base
  has_many :songs
  attr_reader :difficulty_level

  def difficulty_level
    if self.difficulty == 1
      @difficulty_level = "easy as cherry pie"
    elsif self.difficulty == 2
      @difficulty_level = "My daddy didn't raise no fool, but I ain't no genius neither!"
    else
      @difficulty_level = "hard as HECK!"
    end
  end
  

end
