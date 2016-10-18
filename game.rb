require_relative 'Player'
require_relative 'initializer.rb'
require_relative 'run_controller'
require_relative 'it'
require_relative 'goose'
require 'byebug'

class Game

  def initialize(run_controller: RunController, initializer_class: Initializer.new)
    @run_controller = run_controller
    @initializer = initializer_class
  end
  
  def call

    init = _game_initializer
    _run_controller(init[:first_player], init[:num_players])
   
  end  

private
attr_reader :run_controller, :initializer

  def _run_controller(first_player, numplayer)
    run_controller.new(
      player1: first_player,
      numplayer: numplayer
      ).call
  end  

  def _game_initializer
    initializer.call
  end  
end

Game.new.call
