module Summaries

  def season_summary(season, team_id)
    summary = @games.group_games_by(:season, @games.find_all_by_team(team_id))[season]
    generate_season_summary(summary, team_id, false)
  end

  def seasonal_summary(id)
    seasonal_games = @games.group_games_by(:season, @games.find_all_by_team(id))
    seasonal_games.each do |season, games|
      seasonal_games[season] = generate_season_summary(games, id, true)
    end
    seasonal_games
  end

  def generate_season_summary(games, team_id, additional_info)
    final_summary = Hash.new({})
    games_by_type = @games.group_games_by(:type, games)
    final_summary[:preseason] = generate_summary(games_by_type["P"], team_id, additional_info)
    final_summary[:regular_season] = generate_summary(games_by_type["R"], team_id, additional_info)
    final_summary
  end

  def generate_summary(selection, team_id, additional_statistics)
    summary = {}
    summary[:win_percentage] = calculate_win_percentage(team_id, selection)
    summary[:goals_scored] = goals_scored_by_team(selection)[team_id]
    summary[:goals_against] = goals_allowed_by_team(selection)[team_id]
    if additional_statistics
      game_count = selection.count
      if game_count == 0
        summary[:average_goals_scored] = 0.0
        summary[:average_goals_against] = 0.0
      else
        summary[:average_goals_scored] = summary[:goals_scored].to_f / game_count
        summary[:average_goals_against] = summary[:goals_against].to_f / game_count
      end
    end
    summary
  end
end
