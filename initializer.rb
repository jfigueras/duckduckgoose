
class Initializer

  attr_reader :player

  def call
    num_players = _decide_number_of_players
    players = _sort_players(num_players)
    first_player = _decide_first_player(players)

    { num_players: num_players, first_player: first_player }
  end  

  private
  attr_reader :player

  def _decide_number_of_players
    puts "How many players are in this game? (1-100 ...and press enter)"
    num_players = gets
    num_players = num_players.chomp.to_i
  end  

  def _sort_players num_players
    players = Array(1..num_players)
  end

  def _decide_first_player(players)
    players.sample
  end  

end
