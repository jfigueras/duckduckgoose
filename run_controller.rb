


class RunController

  attr_reader :race, :player1, :first_player, :it, :goose_id

  def initialize( player1: player1, numplayer: numplayer, it: It, goose: Goose, player: Player )
  
    @player1 = player1,
    @numplayer = numplayer,
    @player = Player,
    @it = It,
    @goose = Goose
    @players = [ player.new(name: 1), it.new(name: 2), goose.new(name: 3), player.new(name: 4) ] 
  end

  def call
    
 (1..25).each do 

    players = _get_players

    players.map do |player|
      player.introduction
    end  

    players.map do |player|
      player.play
    end  

    speeds = _get_speeds(players)
    newroles = _get_new_roles(speeds)

    #_create_players(newroles)

    puts "********* New Run ********"     

end
    
  end  
  
  private
  attr_reader  :player, :it, :goose

  def _get_players
    @players
  end  

  def _get_speeds(players)
    
    it_speed = players.map{|player| player.speed if player.is_a? It}.compact
    goose_speed = players.map{|player| player.speed if player.is_a? Goose}.compact
    
    {it_speed: it_speed[0], goose_speed: goose_speed[0] }
  end  

  def _get_new_roles speeds
    if speeds[:it_speed] > speeds[:goose_speed]
      puts " goose did not tag it"
      { new_it: goose}
    else
      puts "goose TAG the it!!!"
      { new_it: it}
     end   
  end  

  def _create_players newroles
    @players = [ it.new(name: 1), goose.new(name: 2), player.new(name: 3), player.new(name: 4) ] 
  end  

end       
