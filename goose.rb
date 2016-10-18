

class Goose 

  attr_reader :name, :speed
  attr_writer

  def initialize(name: name )

    @name = name
    @speed = 4
  
  end

  def call
      #goose = _be_the_goose(self)
      #self
  
  end

  def introduction
    puts "player #{name} is the goose"
  end 

  def play
    @speed = rand(1000)/100
    puts "the goose runs at #{@speed}"
  end  

  #def speed
  #  speed
  #end  

  #def speed=(speed)
  #  self.speed = speed
  #end  

  private
  attr_reader  :strategy, :race, :gamerun, :num_players

  def _be_the_goose(it)
    
    puts "player #{it.name} is the #{it.role}"
    it
  end

  def _pick_the_goose

    goose = strategy.new(it: name, num_players: num_players).call
    puts "the IT picked the player #{goose} to be the goose"
    goose
  end  

end  
