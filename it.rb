class It < Player

  attr_reader :name, :goose, :nplayer
  attr_accessor :speed, :energy, :arms, :nplayer 


  def post_initialize(args) 
    @nplayer = args[:nplayer]
    @goose = _choose_goose
  end  

  def introduction
    puts "player #{name} is the IT"
    puts "It has energy #{self.energy} energy"
  end  

  def play
    self.energy = self.energy - 3
    self.speed = energy + rand() * 50
    puts "the it runs at #{speed.round(2)}"
  end  

  def default_speed
    8
  end  

  
  private

  def _choose_goose
    players1 = Array(0..name-1)
    players2 = Array(name+1..nplayer-1)
    players = players1.concat(players2)
    players = players.flatten
    goose = players.sample/10    
  end  
  
 
  
end  
