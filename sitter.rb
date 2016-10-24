class Sitter < Player

  attr_reader :name, :energy
  attr_accessor  :energy, :arms 

  def post_initialize
  end
    
  def introduction
    #self.energy++
  end  

  def play
    self.energy = self.energy + 1
    _look_for_arms
    self.arms.each{ |arm| arm.power = arm.power + 1 }
  end
  
  def default_speed
    0
  end 

  private

  def _look_for_arms
    success = rand()
    if success < 0.10
      gun = [ Ayuke.new, Kamehame.new, Doublehats.new ].sample
      arms << gun
      puts "Sitter #{self.name} found #{gun.name} and will keep on his inventory from now"
    end
  end       

end  
