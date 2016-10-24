class It < Player

  attr_reader :name, :goose
  attr_accessor :speed, :energy, :arms 

  def post_initialize
    @goose = rand()
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
  
 
  
end  
