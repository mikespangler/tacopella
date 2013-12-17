class AddCreatorIdToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :creator_id, :integer
  end
end
