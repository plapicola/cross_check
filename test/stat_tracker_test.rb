require_relative 'test_helper'

class StatTrackerTest < Minitest::Test

  def setup
    @locations = { games: "./data/game_test.csv",
                   teams: "./data/team_info_test.csv",
                   game_tests: "./data/game_teams_stats_test.csv"
                 }


  end

  def test_it_exists
    #skip
    stat_tracker = StatTracker.new

    assert_instance_of StatTracker, stat_tracker
  end

  def test_from_csv_returns_an_instance_of_stat_tracker
    #skip
    stat_tracker = StatTracker.from_csv(@locations)

    assert_instance_of StatTracker, stat_tracker
  end

  def test_it_can_return_file_informaiton
    # skip
    stat_tracker = StatTracker.from_csv(@locations)


    assert_equal 2, stat_tracker.teams.all.count
    assert_instance_of Team, stat_tracker.teams.all.first
  end

  def test_it_can_group_games_by_venue
    stat_tracker = StatTracker.from_csv(@locations)

    assert_instance_of Hash, stat_tracker.group_games_by_venue
    assert_equal 2, stat_tracker.group_games_by_venue.values.first.length
  end

  def test_it_can_determine_most_popular_venue
    stat_tracker = StatTracker.from_csv(@locations)

    assert_equal "TD Garden", stat_tracker.most_popular_venue
  end

  def test_it_can_determine_least_popular_venue
    stat_tracker = StatTracker.from_csv(@locations)

    assert_equal "TD Garden", stat_tracker.least_popular_venue
  end

  def test_it_can_determine_season_with_most_games
    stat_tracker = StatTracker.from_csv(@locations)

    assert_equal 20122013, stat_tracker.season_with_most_games
  end

  def test_it_can_determine_season_with_least_games
    stat_tracker = StatTracker.from_csv(@locations)

    assert_equal 20122013, stat_tracker.season_with_least_games
  end

  def test_it_can_count_games_by_season
    # skip
    stat_tracker = StatTracker.from_csv(@locations)

    expected = {20122013 => 2}

    assert_equal expected, stat_tracker.count_of_games_by_season
  end



end
