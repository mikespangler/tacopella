class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.integer :difficulty

      t.timestamps
    end
  end
end
