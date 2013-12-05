class AddChallengeIdToScores < ActiveRecord::Migration
  def change
    add_column :scores, :challenge_id, :integer
  end
end
