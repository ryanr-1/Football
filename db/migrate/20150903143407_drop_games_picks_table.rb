class DropGamesPicksTable < ActiveRecord::Migration
   def up
    drop_table :games_picks
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
