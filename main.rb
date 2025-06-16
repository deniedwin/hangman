# main.rb
# requiered files inside lib folder for app to run correctly

require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/judge'
require_relative 'lib/player'
require_relative 'lib/state'

class GameRunner
  def self.run
    player = Player.new
    choice = player.load_or_new

    if choice == 'l'
      game = State.load
      if game
        game.play
        game.result
        game.restart
      else
        puts 'No saved game found.'
        game = Game.new
        game.start_game
      end
    else
      game = Game.new
      game.start_game
    end
  end
end

GameRunner.run
