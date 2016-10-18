
class It 

  attr_reader :name, :speed, :goose
  attr_writer :speed 

  def initialize(name: name )

    @name = name
    @speed = 8
    @goose = rand()
    
  end

  def call
    
  end

  def introduction
    puts "player #{name} is the IT"

  end  

  def play
    @speed = rand()*10
    puts "the it runs at #{@speed.round(2)}"
  end  

  
  private
  
 
  
end  
