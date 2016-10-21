

class Goose < Player

  attr_reader :name, :speed, :gun
  attr_accessor :speed 

  def post_initialize
    @gun = [ Ayuke.new, Kamehame.new, Doublehats.new ].sample
  end  

  def introduction
    puts "player #{name} is the goose"
  end 

  def play
    self.speed = rand()*10
    puts "the goose runs at #{speed.round(2)}"
    gun.call
    
  end  
  
  def default_speed
    4
  end  
  
end  
