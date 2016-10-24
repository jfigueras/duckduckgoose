require_relative 'arm'

class Ayuke < Arm
  
  attr_reader :power

  def call
    shoot_the_arm
  end  

  def default_power
    10
  end

  def shoot_the_arm
     rand = rand()
    if rand < power
       puts "#{self.name} shooted"
      self.arm_shooted = true
    end 
  end  

  def default_name
    "ayuke"
  end  

  def default_effect
    "dizzyyy"
  end  


end