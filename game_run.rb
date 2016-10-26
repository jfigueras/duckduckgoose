class GameRun

  attr_reader :players, :config

  def initialize(config: config_array, orderer: ItFirstOrder.new)
    @config = config
    @players = orderer.order( PlayerFactory.new( config: config ).call )

  end  

end  