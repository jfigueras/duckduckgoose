require_relative 'Player'
require_relative 'initializer.rb'


init = Initializer.new.call

numplayer = init[:num_players]
firstplayer = init[:first_player]

players = Array.new

player = Player.new(
      name: "5", 
      gamerun: 0
      ).call




#(1..numplayer).each do |iterator|
  
#  if iterator == firstplayer
#    player = Player.new(
#      name: "#{iterator}"
#      ).call

#  else
#    player = Player.new(
#      name: "#{iterator}"
#      ).call
#  end 
#    players.concat([player])
#end











