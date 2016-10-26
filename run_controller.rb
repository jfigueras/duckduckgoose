class RunController

  include Reload
  include Colorea

  attr_reader :player1, :numplayer, :it, :goose_id

  def initialize( player1: player_1, numplayer: num_player, 
                  it_class: It, goose_class: Goose, sitter_class: Sitter )
  
    @player1 = player1
    @numplayer = numplayer || 10
    @sitter = sitter_class
    @it = it_class
    @goose = goose_class
    @players = _create_players player1, 0 , numplayer
   
  end

  def call
    
    (1..20).each do |i|

      random_color
      puts "********* begining round #{i} ********" 
      reset_color
      
      players = _get_players
      
      players.map do |player|
       player.introduction
      end  
      
      puts ""

      players.map do |player|
        player.play
      end  

      speeds = _get_speeds_and_id(players)
      newroles = _set_new_roles(speeds)
      _create_players(newroles[:new_it_id], newroles[:new_it_energy] , numplayer)
      puts ''
      
    end
  end  

  
  private
  attr_reader  :player, :it, :goose, :players, :sitter
  attr_writer :players 

  def _get_players
    players
  end  

  def _get_speeds_and_id(players)

    it = players.map{|player| {it_id: player.name, it_speed: player.speed } if player.is_a? It}.compact
    goose = players.map{|player| {goose_speed: player.speed, goose_id: player.name, goose_gun: player.gun } if player.is_a? Goose}.compact
    
    {it_speed: it.first[:it_speed],
     it_id: it.first[:it_id], 
     goose_speed: goose.first[:goose_speed], 
     goose_id: goose.first[:goose_id], 
     goose_gun: goose.first[:goose_gun] }
  
  end  

  def _set_new_roles speeds
    if speeds[:it_speed] > speeds[:goose_speed]
        
      if (players[speeds[:goose_id]].arms.any? == true && players[speeds[:goose_id]].arms.first.arm_shooted == true) == true
        guns = players[speeds[:goose_id]].arms
        top_gun = guns.sort_by{|gun| gun.power}.first
        puts""
        puts "Goose was losing the race, but luckily used the #{top_gun.name} arm  @@@@@ ))))) !!"

          if players[speeds[:it_id]].energy > top_gun.power
            red_color
            puts "it has more energy than goose arm and survived the attack"
            puts "Goose did not tag the it"
            reset_color 
             { new_it_id: speeds[:goose_id], new_it_energy: players[speeds[:goose_id]].energy  }

          else  
            green_color
            puts "it has less energy than goose attack and ...it has been tagged by goose"            
            reset_color  
            { new_it_id: speeds[:it_id], new_it_energy: players[speeds[:it_id]].energy  }  
          end  
    
         { new_it_id: speeds[:it_id], new_it_energy: players[speeds[:it_id]].energy  }
      else  
        red_color
        puts""
        puts "goose did not tag it"
        reset_color
         { new_it_id: speeds[:goose_id], new_it_energy: players[speeds[:goose_id]].energy  }
      end

         
    else
      green_color
      puts ""
      puts "goose TAG the it!!!"
      reset_color
      { new_it_id: speeds[:it_id], new_it_energy: players[speeds[:it_id]].energy }
     end   
  end  

 def _create_players newit, new_it_energy, numplayer 

    players = (0..numplayer-1).to_a
    players.delete(newit)
    goose = players.sample 

    config = (0..numplayer-1).map {|i| ["sitter", i ]}
    config[newit] = ["it", newit, numplayer]
    config[goose] = ["goose", goose]
    
    game = GameRun.new(config: config)

    @players = game.players

end  
 
end       
