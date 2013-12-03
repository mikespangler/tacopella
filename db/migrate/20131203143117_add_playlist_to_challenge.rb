class AddPlaylistToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :playlist_key, :text
  end
end
