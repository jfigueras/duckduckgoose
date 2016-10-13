require_relative 'Strategy'
require_relative 'Race'


class Player

  attr_reader :name, :gamerun

  def initialize(name:, gamerun:, strategy: Strategy, race: Race)

    @name = name
    @gamerun = gamerun
    @strategy = strategy
    @race = race

  end

  def call
      it = _be_the_it
      goose = _pick_the_goose
      result = _race(it, goose)
      _prepare_new_run(result)
  end

  private
  attr_reader  :name, :strategy, :race, :gamerun

  def _be_the_it
    it = name
    puts "player #{it} is the it"
    it
  end

  def _pick_the_goose
    goose = strategy.new(it: name).call
    puts "the IT picked the player #{goose} to be the goose"
    goose
  end  

  def _race  it, goose
    race.new(goose: goose, it: it).call
  end  

  def _prepare_new_run(result)
    
    endgame = _decide_depending_number_of_runs
 
    if endgame == true
      puts "its time for a snack!!"
    else
      _one_more_run(result)
    end 
  end  

  def _decide_depending_number_of_runs
    
    if gamerun == 25
      endgame = true
    else
      endgame = false
    end
    endgame

  end  

  def _one_more_run(result)
    if result[:goose_tag_it] == true
      new_it = result[:it]
      player = Player.new( name: "#{new_it}", gamerun: gamerun+1 ).call
    else
      new_it = result[:goose]
      player = Player.new( name: "#{new_it}", gamerun: gamerun+1 ).call
    end
  end  
end  
