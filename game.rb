require_relative 'Player'
require_relative 'initializer.rb'


class Game

  def initialize

  end
  
  def call
    init = _game_initializer
    _ask_first_player_to_start_the_game(init[:first_player], init[:num_players])
  end  

private

  def _ask_first_player_to_start_the_game(id, num_players)
    player = Player.new(
      name: id, 
      gamerun: 0,
      num_players: num_players
      ).call
  end  

  def _game_initializer
    init = Initializer.new.call
  end  
end

Game.new.call
