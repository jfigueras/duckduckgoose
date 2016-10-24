class RunController

  include Reload

  attr_reader :player1, :numplayer, :it, :goose_id

  def initialize( player1: player_1, numplayer: num_player, it_class: It, goose_class: Goose, sitter_class: Sitter )
  
    @player1 = player1
    @numplayer = numplayer || 10
    @sitter = sitter_class
    @it = it_class
    @goose = goose_class
    @players = _create_players player1, 0 , numplayer
   
  end

  def call
    
    (1..100).each do |i|
      puts "********* begining round #{i} ********" 
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
      _sort_players(speeds[:it_id], numplayer)
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
        
      # byebug  
       if (players[speeds[:goose_id]].arms.any? == true && players[speeds[:goose_id]].arms.first.arm_shooted == true) == true
        guns = players[speeds[:goose_id]].arms
        top_gun = guns.sort_by{|gun| gun.power}.first
        puts""
        puts "Goose was losing the race, but luckily used the #{top_gun.name} arm  @@@@@ ))))) !!"

          if players[speeds[:it_id]].energy > top_gun.power

            puts "it has more energy than goose arm and survived the attack"
            puts "Goose did not tag the it"
             { new_it_id: speeds[:goose_id], new_it_energy: players[speeds[:goose_id]].energy  }

          else  
            puts "it has less energy than goose attack and ...it has been tagged by goose"            
            { new_it_id: speeds[:it_id], new_it_energy: players[speeds[:it_id]].energy  }  
          end  
    
         { new_it_id: speeds[:it_id], new_it_energy: players[speeds[:it_id]].energy  }
      else  
        puts""
        puts "goose did not tag it"
         { new_it_id: speeds[:goose_id], new_it_energy: players[speeds[:goose_id]].energy  }
      end

         
    else
      puts ""
      puts "goose TAG the it!!!"
      { new_it_id: speeds[:it_id], new_it_energy: players[speeds[:it_id]].energy }
     end   
  end  

 def _create_players newit, new_it_energy, numplayer 
    
    if players.nil?
      playerstmp = (0..numplayer-1).map{|i| sitter.new(name: i, energy: 50, arms: [])}
      playerstmp[newit] = it.new(name: newit, energy: 50 , arms: [])
      goose_id = (playerstmp[newit].goose * numplayer).to_i
      goose_id = _make_sure_it_doesnt_choose_himself(newit, goose_id, numplayer)
      playerstmp[goose_id] = goose.new(name: goose_id, energy: 50,  arms: [] )
      @players = playerstmp

    else
     
      playerstmp = (0..numplayer-1).map{|i| sitter.new(name: i, energy: players[i].energy, arms: players[i].arms ) }
      playerstmp[newit] = it.new(name: newit, energy: new_it_energy, arms: [] )
      goose_id = (playerstmp[newit].goose * numplayer).to_i
      goose_id = _make_sure_it_doesnt_choose_himself(newit, goose_id, numplayer)
      playerstmp[goose_id] = goose.new(name: goose_id, energy: players[goose_id].energy, arms: players[goose_id].arms )
   
    end  

    @players = playerstmp

  end  

  def _make_sure_it_doesnt_choose_himself(it_id, goose_id, numplayer)
    if it_id == goose_id
      goose_id = _decide_goose(goose_id, numplayer)
    else
      goose_id
    end  
  end 

  def _decide_goose(goose_id, numplayer)
    if goose_id + 1 <= numplayer
       goose_id + 1 
    else
       goose_id -1 
    end 
  end

  def _sort_players(it_id, numplayers)
    if it_id != 0
      playerstmp1 = @players[it_id, numplayer]
      playerstmp2 = @players[0, it_id]
      players = [ playerstmp1, playerstmp2 ].flatten
    end
  end  
end       
