

class Goose < Player

  attr_reader :name, :speed, :ayuke_arm
  attr_accessor :speed 

  def post_initialize
    @ayuke_arm = false
  end  

  def introduction
    puts "player #{name} is the goose"
  end 

  def play
    self.speed = rand()*10
    puts "the goose runs at #{speed.round(2)}"
    ayuke_power
  end  
  
  def default_speed
    4
  end  

  private

  attr_writer :ayuke_arm

  def ayuke_power
    ayuke = rand()
    if ayuke < 0.15
      self.ayuke_arm = true
    end 
  end  
  
end  
