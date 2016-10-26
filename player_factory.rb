class PlayerFactory

  attr_reader :config

  def initialize(config: config_example, 
                 sitter_class: Sitter, it_class: It, goose_class: Goose)
    
    @config = config
    @sitter = sitter_class
    @it = it_class
    @goose = goose_class

  end  

  def call
    config.collect{ |player| _create_player(player) }    
  end  

  private
  attr_reader :sitter, :it, :goose

  def _create_player player

      case player[0]
      when "sitter"
        sitter.new(name: player[1])
      when "it"
        it.new(name: player[1], nplayer: player[3])
      when "goose"
        goose.new(name: player[1] )
      end  
  end  
end
