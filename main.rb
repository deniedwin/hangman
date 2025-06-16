# main.rb
# requiered files inside lib folder for app to run correctly
require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/judge'
require_relative 'lib/player'
require_relative 'lib/state'

# class that runs the game
class GameRunner
  if Player.new.load_or_new == 'l'
    game = State.load
    game.play_rounds
    game.announce_result
  else
    game = Game.new
    game.start_game
  end
end

GameRunner.run