
class Player
  include Reload

  def initialize(name: name_player, energy: energy_player, arms: arms_player)
    @name = name
    @speed = default_speed
    @energy = energy || 0
    @arms = arms || []
    post_initialize
  end

  def introduction
  end  

  def play
  end

  def default_speed
  end
  
  def post_initialize
  end  

 
end  
