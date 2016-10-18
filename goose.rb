

class Goose 

  attr_reader :name, :speed
  attr_writer :speed

  def initialize(name: name )

    @name = name
    @speed = 4
  
  end

  def call
     
  end

  def introduction
    puts "player #{name} is the goose"
  end 

  def play
    @speed = rand()*10
    puts "the goose runs at #{@speed.round(2)}"
  end  

  private
  
end  
