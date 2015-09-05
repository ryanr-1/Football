class CreateGamesPicks < ActiveRecord::Migration
  def change
    create_table :games_picks do |t|
      t.string :games
      t.string :team_names
      t.integer :weeks

      t.timestamps null: false
    end
  end
end
