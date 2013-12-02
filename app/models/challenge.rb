class Challenge < ActiveRecord::Base
  has_many :songs

  EASY = 1
  MEDIUM = 2
  HARD = 3
  
end
