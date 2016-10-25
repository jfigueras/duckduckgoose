require_relative 'arm'

class Doublehats < Arm
  
  attr_reader :power

  def call
    shoot_the_arm
  end  

  def default_power
    5
  end

  def shoot_the_arm
    rand = rand()
    if rand < power
      self.arm_shooted = true
    end 
  end  

  def default_name
    "Doublehats"
  end  

  def default_effect
    "got illuminated by the sun"
  end  

end