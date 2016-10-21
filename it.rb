class It < Player

  attr_reader :name, :goose
  attr_accessor :speed 

  def post_initialize
    @goose = rand()
  end  

  def introduction
    puts "player #{name} is the IT"
  end  

  def play
    self.speed = rand()*10
    puts "the it runs at #{speed.round(2)}"
  end  

  def default_speed
    8
  end  

  
  private
  
 
  
end  
