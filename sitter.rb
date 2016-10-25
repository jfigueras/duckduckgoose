class Sitter < Player
 
 attr_accessor :nplayer

  include Colorea

  attr_reader :name, :energy
  attr_accessor  :energy, :arms 

  def post_initialize nplayer
  end
    
  def introduction
    #self.energy++
  end  

  def play
    self.energy = increaseby(1, self.energy) 
    _look_for_arms
    self.arms.each{ |arm| arm.power = increaseby(1, arm.power) }
  end
  
  def default_speed
    0
  end 

  private

  def _look_for_arms
    success = rand()
    if success < 0.10
      gun = [ Ayuke.new, Kamehame.new, Doublehats.new ].sample

      random_color
      arms << gun
      puts "Sitter #{self.name} found #{gun.name} and will keep on his inventory from now"
      reset_color
      
    end
  end       

end  
