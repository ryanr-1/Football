json.array!(@picks) do |pick|
  json.extract! pick, :id, :games, :team_names, :weeks
  json.url pick_url(pick, format: :json)
end
