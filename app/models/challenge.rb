class Challenge < ActiveRecord::Base
  has_many :songs
  has_many :scores

  Difficulty = {
    :easy => 1,
    :medium => 2,
    :hard => 3
  }

end
