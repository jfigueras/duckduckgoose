


class RunController

  attr_reader :player1, :numplayer, :it, :goose_id

  def initialize( player1: player1, numplayer: numplayer, it: It, goose: Goose, player: Player )
  
    @player1 = player1,
    @numplayer = numplayer || 10,
    @player = Player,
    @it = It,
    @goose = Goose
    #@players = [ player.new(name: 0), it.new(name: 1), goose.new(name: 2), player.new(name: 3) ] 
    @players = _create_players player1, numplayer
  end

  def call
    
 (1..25).each do |i|

    puts "********* begining round #{i} ********" 

    players = _get_players

    players.map do |player|
      player.introduction
    end  
   
    players.map do |player|
      player.play
    end  

    speeds = _get_speeds_and_id(players)
    newroles = _set_new_roles(speeds)
    _create_players(newroles[:new_it_id] , numplayer)
    _sort_players(speeds[:it_id], numplayer)
   
end
    
  end  
  
  private
  attr_reader  :player, :it, :goose

  def _get_players
    @players
  end  

  def _get_speeds_and_id(players)
    it_speed = players.map{|player| player.speed if player.is_a? It}.compact
    it_id = players.map{|player| player.name if player.is_a? It}.compact
    goose_speed = players.map{|player| player.speed if player.is_a? Goose}.compact
    goose_id = players.map{|player| player.name if player.is_a? Goose}.compact

    {it_speed: it_speed[0], it_id: it_id[0], goose_speed: goose_speed[0], goose_id: goose_id[0] }
  end  

  def _set_new_roles speeds
    
    if speeds[:it_speed] > speeds[:goose_speed]
      puts "goose did not tag it"

      { new_it_id: speeds[:goose_id] }
    else
      puts "goose TAG the it!!!"
      { new_it_id: speeds[:it_id] }
     end   
  end  

  def _create_players newit, numplayer
    playerstmp = (0..numplayer-1).map{|i| player.new(name: i)}
    playerstmp[newit] = it.new(name: newit)
   
    goose_id = (playerstmp[newit].goose * numplayer).to_i

    goose_id = _compare_ids(newit, goose_id, numplayer)
    playerstmp[goose_id] = goose.new(name: goose_id)
      
    @players = playerstmp
    
  end  

  def _compare_ids(it_id, goose_id, numplayer)
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
      @players = [ playerstmp1, playerstmp2 ].flatten
    end
  end  

    
end       
