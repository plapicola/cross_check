require_relative './game'

class Games
  attr_reader :all_games

  def initialize
    @all_games = []
  end

  def create(attributes)
    @all_games.push(Game.new(attributes))
  end

  def find_by_id(id)
    @all_games.find do |game|
      game.game_id == id
    end
  end

  def find_by_season_id(id)
    @all_games.find_all do |game|
      game.season == id
    end
  end 
end