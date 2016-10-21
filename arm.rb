class Arm

  attr_reader :power, :arm_shooted, :name, :effect
  attr_writer :arm_shooted


 def initialize
  @arm_shooted = false
  @power = default_power
  @name = default_name
  @effect = default_effect
 end 

 def default_power
  0
 end 

 def shoot
 end
 
 def default_message
 end 

end