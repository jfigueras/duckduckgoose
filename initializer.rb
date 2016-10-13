require 'byebug'


class Initializer

  attr_reader :player

  def initialize()
   

  end  

  def call
    num_players = _decide_number_of_players
    order_players = _sort_players(num_players)
    first_player = _decide_first_player(num_players, order_players)

    { num_players: num_players, order_players: order_players, first_player: first_player }
  
  end  

  private
  attr_reader :player

  def _decide_number_of_players
    10
  end  

  def _sort_players num_players
    [10,9,8,7,6,5,4,3,2,1]
  end

  def _decide_first_player(num_players, order_players)
    5
  end  

end
