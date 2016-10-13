class Strategy

attr_reader :it

  def initialize(it:)
    @it = it.to_i
  end
  
  def call
    
    players = _create_players_arrays_excluding(it)
    _select_goose(players)
    
  end  

private
attr_reader :goose

  def _create_players_arrays_excluding it
    players =[Array(1..it-1), Array(it+1..10)]
    players = players.flatten
  end

  def _select_goose players
    players.sample
  end  

end