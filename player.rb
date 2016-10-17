require_relative 'strategy'
require_relative 'race'


class Player

  attr_reader :name, :gamerun, :role

  def initialize(name: name , role: role, num_players: num_players, strategy: Strategy )

    @name = name
    @role = role
    @num_players = num_players
    @strategy = strategy

  end

  def call
      it = _be_the_it(self)
    
      goose = _pick_the_goose

      {it: self, goose: goose }
  
  end


  private
  attr_reader  :strategy, :race, :gamerun, :num_players
 # attr_writer :role

  def _be_the_it(it)
    
    puts "player #{it.name} is the #{it.role}"
    it
  end

  def _pick_the_goose

    goose = strategy.new(it: name, num_players: num_players).call
    puts "the IT picked the player #{goose} to be the goose"
    goose
  end  

end  
