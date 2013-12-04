class DropPlaylistIdFromChallenges < ActiveRecord::Migration
  def change
    remove_column :challenges, :playlist_key
  end
end
