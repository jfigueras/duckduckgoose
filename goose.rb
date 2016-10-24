class Goose < Player

  attr_reader :name, :speed, :gun 
  attr_accessor :speed, :energy, :arms 

  def post_initialize
    @gun = [ Ayuke.new, Kamehame.new, Doublehats.new ].sample
  end  

  def introduction
   
    puts "player #{name} is the goose"
    puts "Goose has #{self.energy} energy"
  end 

  def play
    self.energy = self.energy - 5
    self.speed = energy + rand() * 50
    puts "the goose runs at #{speed.round(2)}"

    if self.arms.any? == true
      top_gun = self.arms.sort_by{|gun| gun.power}.first
      self.arms.each{|arm| puts "Goose has the #{arm.name} arm with a #{arm.power} power"}
      top_gun.call
    end  

  end  
  
  def default_speed
    4
  end  
  
end  
