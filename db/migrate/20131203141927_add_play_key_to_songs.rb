class AddPlayKeyToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :play_key, :string
  end
end
