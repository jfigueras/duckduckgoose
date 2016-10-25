
class Player
  include Reload

  def initialize(args)
    @name = args[:name]
    @speed = default_speed
    @energy = energy || 0
    @arms = arms || []
    post_initialize args
  end

  def introduction
  end  

  def play
  end

  def default_speed
  end
  
  def post_initialize nplayer
  end  
 
end  
