# main.rb
# requiered files inside lib folder for app to run correctly
require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/judge'
require_relative 'lib/player'
require_relative 'lib/state'

# class that runs the game
class GameRunner
  def self.run
    if Player.new.load_or_new == 'l'
      game = State.load
      if game
        game.play_rounds
        game.announce_result
      else
        puts "No saved game found. Starting a new game."
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
