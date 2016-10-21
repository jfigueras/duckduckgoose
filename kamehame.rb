require_relative 'arm'

class Kamehame < Arm
  
  attr_reader :power
  attr_writer :power

  def call
    shoot_the_arm
  end  

  def default_power
    0.15
  end

  def shoot_the_arm
    rand = rand()
    if rand < power
      #byebug
      self.arm_shooted = true
    end 
  end  

  def default_name
    "Kamehame"
  end  

  def default_effect
    "is looking for dragon balls"
  end  

end