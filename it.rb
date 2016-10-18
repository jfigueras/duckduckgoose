
class It 

  attr_reader :name, :speed
  attr_writer :speed 

  def initialize(name: name )

    @name = name
    @speed = 8
    
  end

  def call
    
  end

  def introduction
    puts "player #{name} is the IT"
  end  

  def play
    @speed = rand(1000)/100
    puts "the it runs at #{speed}"
  end  

  
  private
  attr_reader  :strategy, :race, :gamerun, :num_players
 

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
