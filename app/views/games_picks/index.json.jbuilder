json.array!(@games_picks) do |games_pick|
  json.extract! games_pick, :id, :games, :team_names, :weeks
  json.url games_pick_url(games_pick, format: :json)
end
